import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../modele/case.dart';
import '../modele/coup.dart';
import '../modele/grille.dart';
import '../riverpod/player/player_notifier.dart';
import 'ecran_score.dart';

enum Difficulty { facile, moyen, difficile }

class EcranGrille extends ConsumerStatefulWidget {
  final Difficulty difficulty;

  const EcranGrille({super.key, required this.difficulty});

  @override
  ConsumerState createState() => _EcranGrilleState();
}

class _EcranGrilleState extends ConsumerState<EcranGrille> {
  late Grille grille;
  late int time;
  bool finDePartie = false;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  @override
  void initState() {
    super.initState();
    grille = _initialiserGrille();
  }

  Grille _initialiserGrille() {
    switch (widget.difficulty) {
      case Difficulty.facile:
        return Grille(taille: 5, nbMines: 3);
      case Difficulty.moyen:
        return Grille(taille: 7, nbMines: 5);
      case Difficulty.difficile:
        return Grille(taille: 10, nbMines: 10);
    }
  }

  Text _initialiserTitle() {
    switch (widget.difficulty) {
      case Difficulty.facile:
        return const Text("Grille 5x5 - 3 mines");
      case Difficulty.moyen:
        return const Text("Grille 7x7 - 5 mines");
      case Difficulty.difficile:
        return const Text("Grille 10x10 - 10 mines");
    }
  }

  Color _getColorForCase(Case maCase, Coordonnees coordonnees) {
    if (maCase.etat == Etat.decouverte) {
      if (maCase.minee) {
        return Colors.red;
      } else {
        if ((coordonnees.colonne + coordonnees.ligne) % 2 == 0) {
          return Colors.brown.shade100;
        } else {
          return Colors.brown.shade200;
        }
      }
    } else if (maCase.etat == Etat.afficher) {
      return Colors.blue;
    } else {
      if ((coordonnees.colonne + coordonnees.ligne) % 2 == 0) {
        return Colors.green.shade300;
      } else {
        return Colors.green.shade400;
      }
    }
  }

  Widget _buildContentForCase(Case maCase) {
    if (maCase.etat == Etat.decouverte) {
      if (maCase.minee) {
        return const Icon(Icons.local_fire_department);
      } else {
        if (maCase.nbMinesAutour == 0) {
          return const SizedBox();
        } else {
          return Text(maCase.nbMinesAutour.toString());
        }
      }
    } else if (maCase.etat == Etat.marquee) {
      return const Icon(
        Icons.flag,
        color: Colors.red,
      );
    } else if (maCase.etat == Etat.afficher) {
      return Icon(
        Icons.radio_button_off,
        color: Colors.blue.shade300,
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _maGrille() {
    return Column(
      children: List.generate(grille.taille, (ligne) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(grille.taille, (colonne) {
            Case maCase = grille.getCase((ligne: ligne, colonne: colonne));
            return GestureDetector(
              onTap: finDePartie
                  ? null
                  : () {
                      startTimer();
                      setState(() {
                        grille.mettreAJour(Coup(ligne, colonne, ActionCase.decouvrir));
                        finDePartie = checkIfItsFinish(grille);
                      });
                    },
              onLongPress: finDePartie
                  ? null
                  : () {
                      setState(() {
                        grille.mettreAJour(Coup(ligne, colonne, ActionCase.marquer));
                        finDePartie = checkIfItsFinish(grille);
                      });
                    },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: _getColorForCase(maCase, (ligne: ligne, colonne: colonne)),
                ),
                width: 50,
                height: 50,
                child: Center(
                  child: _buildContentForCase(maCase),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  bool checkIfItsFinish(Grille maGrille) {
    if (maGrille.isFinie()) {
      stopTimer();
      displayGrille();
      return true;
    } else {
      return false;
    }
  }

  void startTimer() {
    _stopWatchTimer.onStartTimer();
  }

  void stopTimer() {
    _stopWatchTimer.onStopTimer();
  }

  int get calculatesScore {
    if (grille.isPerdue()) return 0;
    double coeffTempsParCase = max(1.0, 10000.0 - time / (grille.taille * grille.taille - grille.nbMines).toDouble());
    double coeffDifficulte = 100.00;
    grille.nbMines.toDouble() / (grille.taille * grille.taille).toDouble();
    return ((grille.taille * grille.taille - grille.nbMines).toDouble() * coeffTempsParCase / coeffDifficulte * coeffDifficulte).toInt();
  }

  void displayGrille() async {
    for (int ligne = 0; ligne < grille.taille; ligne++) {
      for (int colonne = 0; colonne < grille.taille; colonne++) {
        Case maCase = grille.getCase((ligne: ligne, colonne: colonne));
        if (maCase.minee) {
          await Future.delayed(const Duration(milliseconds: 150), () {
            setState(() {
              grille.mettreAJour(Coup(ligne, colonne, ActionCase.montrer));
            });
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Démineur - Jouer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _initialiserTitle(),
          const SizedBox(height: 20),
          _maGrille(),
          StreamBuilder<int>(
            stream: _stopWatchTimer.rawTime,
            initialData: _stopWatchTimer.rawTime.value,
            builder: (context, snap) {
              time = snap.data!;
              final displayTime = StopWatchTimer.getDisplayTime(time, hours: false);
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: const TextStyle(fontSize: 40, fontFamily: 'Helvetica', fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
          if (finDePartie)
            ElevatedButton(
              onPressed: () {
                stopTimer();
                ref.read(playerProvider.notifier).scorePlayer(calculatesScore, time);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EcranScore(),
                  ),
                );
              },
              child: const Text("Score"),
            ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/screens/ecran_grille.dart';
import 'package:tp02/widgets/leader_board.dart';

import '../riverpod/game/game_notifier.dart';

class EcranAccueil extends ConsumerStatefulWidget {
  const EcranAccueil({super.key});

  @override
  ConsumerState<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends ConsumerState<EcranAccueil> {
  Difficulty _selectedDifficulty = Difficulty.values[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Démineur - Choisir la difficulté"),
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const ProfileScreen(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      value: _selectedDifficulty,
                      items: Difficulty.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(
                                category.name.toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedDifficulty = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (FirebaseAuth.instance.currentUser?.displayName != null) {
                          ref
                              .read(gameProvider.notifier)
                              .addPlayer(FirebaseAuth.instance.currentUser?.displayName, DateTime.now(), _selectedDifficulty);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EcranGrille(difficulty: _selectedDifficulty),
                            ),
                          );
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Pseudo manquant'),
                              content: const Text('Veuillez ajouter un pseudo afin de pouvoir lancer une partie.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text('Jouer'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const LeaderBoard(),
        ],
      ),
    );
  }
}

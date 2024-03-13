import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../modele/player.dart';
import 'ecran_acceuil.dart';

class EcranScore extends StatefulWidget {
  final int chrono;
  final int score;

  const EcranScore({super.key, required this.chrono, required this.score});

  @override
  State<EcranScore> createState() => _EcranScoreState();
}

class _EcranScoreState extends State<EcranScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Démineur - Score obtenu"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${PlayerList().list[0].name}, Vous avez fini en ${StopWatchTimer.getDisplayTime(widget.chrono, hours: false)} secondes."),
            const SizedBox(height: 30),
            Text("Votre score : ${widget.score}"),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EcranAccueil(),
                    ),
                  );
                },
                child: const Text("Rejouer")),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:tp02/riverpod/game/game_notifier.dart';

import 'ecran_acceuil.dart';

class EcranScore extends ConsumerWidget {
  const EcranScore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.watch(gameProvider).player;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Démineur - Score obtenu"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "${currentPlayer!.name ?? "Joueur"} , Vous avez fini en ${StopWatchTimer.getDisplayTime(currentPlayer.time ?? 0, hours: false)} secondes."),
            const SizedBox(height: 30),
            Text("Votre score : ${currentPlayer.score}"),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  if (currentPlayer.name != null) {
                    ref.read(gameProvider.notifier).addToLeaderBoard();
                  }
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../riverpod/leader_board/leader_board_notifier.dart';

class LeaderBoard extends ConsumerWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var leaderBoard = ref.watch(leaderBoardProvider).players;
    int maxSizeLeaderBoard = 10;

    if (leaderBoard.isNotEmpty) {
      return Column(
        children: [
          const Text(
            "LeaderBoard",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            width: 600,
            height: 600,
            child: ListView.builder(
              itemCount: leaderBoard.length < maxSizeLeaderBoard ? leaderBoard.length : maxSizeLeaderBoard,
              itemBuilder: (context, index) {
                final player = leaderBoard[index];
                // Convertie le Timestamp Firestore en DateTime Dart
                Timestamp timestamp = player["timestamp"];
                DateTime date = timestamp.toDate();
                return Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Dismissible(
                      resizeDuration: const Duration(milliseconds: 500),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        ref.read(leaderBoardProvider.notifier).deletePlayerFromLeaderBoard(player["id"]);
                      },
                      key: ValueKey(leaderBoard[index]),
                      background: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: ListTile(
                        leading: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (index == 0)
                              const Icon(
                                Icons.emoji_events,
                                color: Colors.yellow,
                              )
                            else if (index == 1)
                              const Icon(
                                Icons.emoji_events,
                                color: Colors.grey,
                              )
                            else if (index == 2)
                              const Icon(
                                Icons.emoji_events,
                                color: Colors.brown,
                              )
                            else
                              Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                          ],
                        ),
                        title: Row(
                          children: [
                            const SizedBox(width: 5),
                            Text('${player["userName"]} : ${player["score"]}'),
                            const Spacer(),
                            Text(DateFormat('dd/MM/yyyy').format(date)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return const Text('Aucun joueur dans le LeaderBoard.');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/game/game_notifier.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  LeaderBoardState createState() => LeaderBoardState();
}

class LeaderBoardState extends ConsumerState<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: ref.read(gameProvider.notifier).getLeaderBoard(),
      builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        } else {
          final List<Map<String, dynamic>>? leaderBoard = snapshot.data;
          if (leaderBoard != null && leaderBoard.isNotEmpty) {
            return Column(
              children: [
                const Text(
                  "LeaderBoard",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 500,
                  height: 600,
                  child: ListView.builder(
                    itemCount: leaderBoard.length < 10 ? leaderBoard.length : 10,
                    itemBuilder: (context, index) {
                      final player = leaderBoard[index];
                      return Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
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
                              ],
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
      },
    );
  }
}

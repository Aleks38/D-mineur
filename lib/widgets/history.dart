import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tp02/modele/player.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});

  @override
  ConsumerState<History> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<History> {
  PlayerList playerHistory = PlayerList();

  @override
  void initState() {
    super.initState();
    playerHistory.sortByScore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Historique de la session",
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          width: 500,
          height: 600,
          child: ListView.builder(
            itemCount: playerHistory.list.length,
            itemBuilder: (context, index) {
              final player = playerHistory.list[index];
              if (playerHistory.list.isEmpty) {
                const Text("Votre historique s'affichera ici");
              } else {
                return Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Dismissible(
                      resizeDuration: const Duration(milliseconds: 500),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          playerHistory.list.remove(playerHistory.list[index]);
                        });
                      },
                      key: ValueKey(playerHistory.list[index]),
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
                            Text('${player.difficulty.name.toUpperCase()} : ${player.score}'),
                            const Spacer(),
                            Text(DateFormat('dd/MM/yyyy HH:mm').format(player.date)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

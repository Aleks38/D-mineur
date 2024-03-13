import 'package:flutter/material.dart';
import 'package:tp02/modele/player.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  PlayerList leaderBoard = PlayerList();

  @override
  void initState() {
    super.initState();
    leaderBoard.sortByScore();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: leaderBoard.list.length < 10 ? leaderBoard.list.length : 10,
      itemBuilder: (context, index) {
        final player = leaderBoard.list[index];
        return Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Dismissible(
              resizeDuration: const Duration(milliseconds: 500),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  leaderBoard.list.remove(leaderBoard.list[index]);
                });
              },
              key: ValueKey(leaderBoard.list[index]),
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
                        index.toString(),
                        style: const TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
                title: Row(
                  children: [
                    const SizedBox(width: 5),
                    Text('${player.name} : ${player.score}'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

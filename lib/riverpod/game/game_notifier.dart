import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/riverpod/game/game_state.dart';
import 'package:tp02/screens/ecran_grille.dart';

import '../../modele/player.dart';

CollectionReference eventsRef = FirebaseFirestore.instance.collection("LeaderBoard");

final gameProvider = StateNotifierProvider<GameNotifier, GameState>(
  (ref) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(GameState.initial());

  void addPlayer(String? name, DateTime dateGame, Difficulty difficulty) {
    state = state.copyWith(player: Player(name: name, date: dateGame, difficulty: difficulty));
  }

  void scorePlayer(int score, int time) {
    state.player?.time = time;
    state.player?.score = score;
  }

  Future<void> addToLeaderBoard() async {
    final user = <String, dynamic>{
      "userName": state.player!.name!,
      "score": state.player!.score!,
      "timestamp": state.player!.date,
    };

    await eventsRef.add(user);
  }

  Future<List<Map<String, dynamic>>> getLeaderBoard() async {
    try {
      QuerySnapshot querySnapshot = await eventsRef.orderBy('score', descending: true).get();
      List<Map<String, dynamic>> leaderBoardData = [];
      for (var doc in querySnapshot.docs) {
        leaderBoardData.add(doc.data() as Map<String, dynamic>);
      }
      return leaderBoardData;
    } catch (e) {
      return [];
    }
  }
}

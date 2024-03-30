import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../player/player_state.dart';
import 'leader_board_state.dart';

CollectionReference eventsRef = FirebaseFirestore.instance.collection("LeaderBoard");

final leaderBoardProvider = StateNotifierProvider<LeaderBoardNotifier, LeaderBoardState>(
  (ref) => LeaderBoardNotifier(),
);

class LeaderBoardNotifier extends StateNotifier<LeaderBoardState> {
  LeaderBoardNotifier() : super(LeaderBoardState.initial()) {
    load();
  }

  Future<void> load() async {
    await getLeaderBoard();
  }

  Future<void> addToLeaderBoard(PlayerState player) async {
    final user = <String, dynamic>{
      "userName": player.userName,
      "score": player.score,
      "timestamp": player.timestamp,
    };

    await eventsRef.add(user);
    load();
  }

  Future<void> deletePlayerFromLeaderBoard(String playerId) async {
    await eventsRef.doc(playerId).delete();
    load();
  }

  Future<void> getLeaderBoard() async {
    QuerySnapshot querySnapshot = await eventsRef.orderBy('score', descending: true).get();
    List<Map<String, dynamic>> leaderBoardData = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> userData = doc.data() as Map<String, dynamic>;
      userData['id'] = doc.id;
      leaderBoardData.add(userData);
    }
    state = state.copyWith(players: leaderBoardData);
  }
}

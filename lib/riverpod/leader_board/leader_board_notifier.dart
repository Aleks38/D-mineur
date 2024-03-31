import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../player/player_state.dart';
import 'leader_board_state.dart';

// Instancie la connexion avec Firestore
CollectionReference eventsRef = FirebaseFirestore.instance.collection("LeaderBoard");

final leaderBoardProvider = StateNotifierProvider<LeaderBoardNotifier, LeaderBoardState>(
  (ref) => LeaderBoardNotifier(),
);

class LeaderBoardNotifier extends StateNotifier<LeaderBoardState> {
  // Initialisation du notifier
  LeaderBoardNotifier() : super(LeaderBoardState.initial()) {
    getLeaderBoard();
  }

  // Ajouter un joueur à la BDD Firestore
  Future<void> addToLeaderBoard(PlayerState player) async {
    final user = <String, dynamic>{
      "userName": player.userName,
      "score": player.score,
      "timestamp": player.timestamp,
    };

    await eventsRef.add(user);
    getLeaderBoard();
  }

  // Supprime un joueur de la BDD Firestore
  Future<void> deletePlayerFromLeaderBoard(String playerId) async {
    await eventsRef.doc(playerId).delete();
    getLeaderBoard();
  }

  // Récupère les data dans la BDD
  Future<void> getLeaderBoard() async {
    // Récupère et trie les données en fonction du score
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

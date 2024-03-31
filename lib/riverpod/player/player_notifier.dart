import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demineur/riverpod/player/player_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screens/ecran_grille.dart';

CollectionReference eventsRef = FirebaseFirestore.instance.collection("LeaderBoard");

final playerProvider = StateNotifierProvider<PLayerNotifier, PlayerState>(
  (ref) => PLayerNotifier(),
);

class PLayerNotifier extends StateNotifier<PlayerState> {
  // Initialisation du notifier
  PLayerNotifier() : super(PlayerState.initial());

  // Crée un joueur
  void addPlayer(String name, DateTime dateGame, Difficulty difficulty) {
    state = state.copyWith(userName: name, timestamp: dateGame, difficulty: difficulty);
  }

  // Associe un score au joueur
  void scorePlayer(int score, int time) {
    state = state.copyWith(time: time, score: score);
  }
}

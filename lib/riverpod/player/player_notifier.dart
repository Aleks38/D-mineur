import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/riverpod/player/player_state.dart';
import 'package:tp02/screens/ecran_grille.dart';

CollectionReference eventsRef = FirebaseFirestore.instance.collection("LeaderBoard");

final playerProvider = StateNotifierProvider<PLayerNotifier, PlayerState>(
  (ref) => PLayerNotifier(),
);

class PLayerNotifier extends StateNotifier<PlayerState> {
  PLayerNotifier() : super(PlayerState.initial()) {
    load();
  }

  Future<void> load() async {}

  void addPlayer(String name, DateTime dateGame, Difficulty difficulty) {
    state = state.copyWith(userName: name, timestamp: dateGame, difficulty: difficulty);
  }

  void scorePlayer(int score, int time) {
    state = state.copyWith(time: time, score: score);
  }
}

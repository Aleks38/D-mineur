import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/riverpod/game/game_state.dart';

import '../../modele/player.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameState>(
  (ref) => GameNotifier(),
);

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(GameState.initial());

  void addPlayer(String name, DateTime dateGame) {
    state = state.copyWith(player: Player(name: name, date: dateGame));
  }

  void scorePlayer(int score, int time) {
    state.player?.time = time;
    state.player?.score = score;
  }
}

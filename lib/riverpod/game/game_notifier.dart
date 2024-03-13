import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/riverpod/game/game_state.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) => GameNotifier());

class GameNotifier extends StateNotifier<GameState> {
  GameNotifier() : super(GameState.initial());
}

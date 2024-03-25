import 'package:freezed_annotation/freezed_annotation.dart';

import '../../modele/player.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    Player? player,
    required List<Player> players,
  }) = _GameState;

  factory GameState.initial() => GameState(
        players: [],
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../modele/player.dart';

part 'game_state.freezed.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    String? playerName,
    int? playerScore,
    int? playerTime,
    DateTime? dateGame,
    required List<Player> players,
  }) = _GameState;

  factory GameState.initial() => GameState(
        players: [],
      );
}

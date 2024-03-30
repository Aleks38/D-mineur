import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tp02/screens/ecran_grille.dart';

part 'player_state.freezed.dart';

@freezed
class PlayerState with _$PlayerState {
  factory PlayerState({
    String? userName,
    int? score,
    DateTime? timestamp,
    int? time,
    required Difficulty difficulty,
  }) = _PlayerState;

  factory PlayerState.initial() => PlayerState(
        userName: null,
        score: null,
        timestamp: null,
        time: null,
        difficulty: Difficulty.facile,
      );
}

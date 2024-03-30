import 'package:freezed_annotation/freezed_annotation.dart';

part 'leader_board_state.freezed.dart';

@freezed
class LeaderBoardState with _$LeaderBoardState {
  factory LeaderBoardState({
    required List<Map<String, dynamic>> players,
  }) = _LeaderBoardState;

  factory LeaderBoardState.initial() => LeaderBoardState(
        players: [],
      );
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  String? get playerName => throw _privateConstructorUsedError;
  int? get playerScore => throw _privateConstructorUsedError;
  int? get playerTime => throw _privateConstructorUsedError;
  DateTime? get dateGame => throw _privateConstructorUsedError;
  List<Player> get players => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {String? playerName,
      int? playerScore,
      int? playerTime,
      DateTime? dateGame,
      List<Player> players});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerScore = freezed,
    Object? playerTime = freezed,
    Object? dateGame = freezed,
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      playerScore: freezed == playerScore
          ? _value.playerScore
          : playerScore // ignore: cast_nullable_to_non_nullable
              as int?,
      playerTime: freezed == playerTime
          ? _value.playerTime
          : playerTime // ignore: cast_nullable_to_non_nullable
              as int?,
      dateGame: freezed == dateGame
          ? _value.dateGame
          : dateGame // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? playerName,
      int? playerScore,
      int? playerTime,
      DateTime? dateGame,
      List<Player> players});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerName = freezed,
    Object? playerScore = freezed,
    Object? playerTime = freezed,
    Object? dateGame = freezed,
    Object? players = null,
  }) {
    return _then(_$GameStateImpl(
      playerName: freezed == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String?,
      playerScore: freezed == playerScore
          ? _value.playerScore
          : playerScore // ignore: cast_nullable_to_non_nullable
              as int?,
      playerTime: freezed == playerTime
          ? _value.playerTime
          : playerTime // ignore: cast_nullable_to_non_nullable
              as int?,
      dateGame: freezed == dateGame
          ? _value.dateGame
          : dateGame // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  _$GameStateImpl(
      {this.playerName,
      this.playerScore,
      this.playerTime,
      this.dateGame,
      required final List<Player> players})
      : _players = players;

  @override
  final String? playerName;
  @override
  final int? playerScore;
  @override
  final int? playerTime;
  @override
  final DateTime? dateGame;
  final List<Player> _players;
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'GameState(playerName: $playerName, playerScore: $playerScore, playerTime: $playerTime, dateGame: $dateGame, players: $players)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.playerScore, playerScore) ||
                other.playerScore == playerScore) &&
            (identical(other.playerTime, playerTime) ||
                other.playerTime == playerTime) &&
            (identical(other.dateGame, dateGame) ||
                other.dateGame == dateGame) &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode => Object.hash(runtimeType, playerName, playerScore,
      playerTime, dateGame, const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  factory _GameState(
      {final String? playerName,
      final int? playerScore,
      final int? playerTime,
      final DateTime? dateGame,
      required final List<Player> players}) = _$GameStateImpl;

  @override
  String? get playerName;
  @override
  int? get playerScore;
  @override
  int? get playerTime;
  @override
  DateTime? get dateGame;
  @override
  List<Player> get players;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderBoardState {
  List<Map<String, dynamic>> get players => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderBoardStateCopyWith<LeaderBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderBoardStateCopyWith<$Res> {
  factory $LeaderBoardStateCopyWith(
          LeaderBoardState value, $Res Function(LeaderBoardState) then) =
      _$LeaderBoardStateCopyWithImpl<$Res, LeaderBoardState>;
  @useResult
  $Res call({List<Map<String, dynamic>> players});
}

/// @nodoc
class _$LeaderBoardStateCopyWithImpl<$Res, $Val extends LeaderBoardState>
    implements $LeaderBoardStateCopyWith<$Res> {
  _$LeaderBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
  }) {
    return _then(_value.copyWith(
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderBoardStateImplCopyWith<$Res>
    implements $LeaderBoardStateCopyWith<$Res> {
  factory _$$LeaderBoardStateImplCopyWith(_$LeaderBoardStateImpl value,
          $Res Function(_$LeaderBoardStateImpl) then) =
      __$$LeaderBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> players});
}

/// @nodoc
class __$$LeaderBoardStateImplCopyWithImpl<$Res>
    extends _$LeaderBoardStateCopyWithImpl<$Res, _$LeaderBoardStateImpl>
    implements _$$LeaderBoardStateImplCopyWith<$Res> {
  __$$LeaderBoardStateImplCopyWithImpl(_$LeaderBoardStateImpl _value,
      $Res Function(_$LeaderBoardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? players = null,
  }) {
    return _then(_$LeaderBoardStateImpl(
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$LeaderBoardStateImpl implements _LeaderBoardState {
  _$LeaderBoardStateImpl({required final List<Map<String, dynamic>> players})
      : _players = players;

  final List<Map<String, dynamic>> _players;
  @override
  List<Map<String, dynamic>> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  @override
  String toString() {
    return 'LeaderBoardState(players: $players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderBoardStateImpl &&
            const DeepCollectionEquality().equals(other._players, _players));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderBoardStateImplCopyWith<_$LeaderBoardStateImpl> get copyWith =>
      __$$LeaderBoardStateImplCopyWithImpl<_$LeaderBoardStateImpl>(
          this, _$identity);
}

abstract class _LeaderBoardState implements LeaderBoardState {
  factory _LeaderBoardState(
          {required final List<Map<String, dynamic>> players}) =
      _$LeaderBoardStateImpl;

  @override
  List<Map<String, dynamic>> get players;
  @override
  @JsonKey(ignore: true)
  _$$LeaderBoardStateImplCopyWith<_$LeaderBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

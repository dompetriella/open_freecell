// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppStateData {
  List<List<CardData>> get completedPiles => throw _privateConstructorUsedError;
  List<List<CardData>> get playColumns => throw _privateConstructorUsedError;
  List<List<CardData>> get undoCompletedPiles =>
      throw _privateConstructorUsedError;
  List<List<CardData>> get undoPlayColumns =>
      throw _privateConstructorUsedError;
  bool get gameIsWon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateDataCopyWith<AppStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateDataCopyWith<$Res> {
  factory $AppStateDataCopyWith(
          AppStateData value, $Res Function(AppStateData) then) =
      _$AppStateDataCopyWithImpl<$Res, AppStateData>;
  @useResult
  $Res call(
      {List<List<CardData>> completedPiles,
      List<List<CardData>> playColumns,
      List<List<CardData>> undoCompletedPiles,
      List<List<CardData>> undoPlayColumns,
      bool gameIsWon});
}

/// @nodoc
class _$AppStateDataCopyWithImpl<$Res, $Val extends AppStateData>
    implements $AppStateDataCopyWith<$Res> {
  _$AppStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedPiles = null,
    Object? playColumns = null,
    Object? undoCompletedPiles = null,
    Object? undoPlayColumns = null,
    Object? gameIsWon = null,
  }) {
    return _then(_value.copyWith(
      completedPiles: null == completedPiles
          ? _value.completedPiles
          : completedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      playColumns: null == playColumns
          ? _value.playColumns
          : playColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      undoCompletedPiles: null == undoCompletedPiles
          ? _value.undoCompletedPiles
          : undoCompletedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      undoPlayColumns: null == undoPlayColumns
          ? _value.undoPlayColumns
          : undoPlayColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      gameIsWon: null == gameIsWon
          ? _value.gameIsWon
          : gameIsWon // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppStateDataImplCopyWith<$Res>
    implements $AppStateDataCopyWith<$Res> {
  factory _$$AppStateDataImplCopyWith(
          _$AppStateDataImpl value, $Res Function(_$AppStateDataImpl) then) =
      __$$AppStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<CardData>> completedPiles,
      List<List<CardData>> playColumns,
      List<List<CardData>> undoCompletedPiles,
      List<List<CardData>> undoPlayColumns,
      bool gameIsWon});
}

/// @nodoc
class __$$AppStateDataImplCopyWithImpl<$Res>
    extends _$AppStateDataCopyWithImpl<$Res, _$AppStateDataImpl>
    implements _$$AppStateDataImplCopyWith<$Res> {
  __$$AppStateDataImplCopyWithImpl(
      _$AppStateDataImpl _value, $Res Function(_$AppStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedPiles = null,
    Object? playColumns = null,
    Object? undoCompletedPiles = null,
    Object? undoPlayColumns = null,
    Object? gameIsWon = null,
  }) {
    return _then(_$AppStateDataImpl(
      completedPiles: null == completedPiles
          ? _value._completedPiles
          : completedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      playColumns: null == playColumns
          ? _value._playColumns
          : playColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      undoCompletedPiles: null == undoCompletedPiles
          ? _value._undoCompletedPiles
          : undoCompletedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      undoPlayColumns: null == undoPlayColumns
          ? _value._undoPlayColumns
          : undoPlayColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      gameIsWon: null == gameIsWon
          ? _value.gameIsWon
          : gameIsWon // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateDataImpl implements _AppStateData {
  _$AppStateDataImpl(
      {final List<List<CardData>> completedPiles = const [],
      final List<List<CardData>> playColumns = const [],
      final List<List<CardData>> undoCompletedPiles = const [],
      final List<List<CardData>> undoPlayColumns = const [],
      this.gameIsWon = false})
      : _completedPiles = completedPiles,
        _playColumns = playColumns,
        _undoCompletedPiles = undoCompletedPiles,
        _undoPlayColumns = undoPlayColumns;

  final List<List<CardData>> _completedPiles;
  @override
  @JsonKey()
  List<List<CardData>> get completedPiles {
    if (_completedPiles is EqualUnmodifiableListView) return _completedPiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedPiles);
  }

  final List<List<CardData>> _playColumns;
  @override
  @JsonKey()
  List<List<CardData>> get playColumns {
    if (_playColumns is EqualUnmodifiableListView) return _playColumns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playColumns);
  }

  final List<List<CardData>> _undoCompletedPiles;
  @override
  @JsonKey()
  List<List<CardData>> get undoCompletedPiles {
    if (_undoCompletedPiles is EqualUnmodifiableListView)
      return _undoCompletedPiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_undoCompletedPiles);
  }

  final List<List<CardData>> _undoPlayColumns;
  @override
  @JsonKey()
  List<List<CardData>> get undoPlayColumns {
    if (_undoPlayColumns is EqualUnmodifiableListView) return _undoPlayColumns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_undoPlayColumns);
  }

  @override
  @JsonKey()
  final bool gameIsWon;

  @override
  String toString() {
    return 'AppStateData(completedPiles: $completedPiles, playColumns: $playColumns, undoCompletedPiles: $undoCompletedPiles, undoPlayColumns: $undoPlayColumns, gameIsWon: $gameIsWon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._completedPiles, _completedPiles) &&
            const DeepCollectionEquality()
                .equals(other._playColumns, _playColumns) &&
            const DeepCollectionEquality()
                .equals(other._undoCompletedPiles, _undoCompletedPiles) &&
            const DeepCollectionEquality()
                .equals(other._undoPlayColumns, _undoPlayColumns) &&
            (identical(other.gameIsWon, gameIsWon) ||
                other.gameIsWon == gameIsWon));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_completedPiles),
      const DeepCollectionEquality().hash(_playColumns),
      const DeepCollectionEquality().hash(_undoCompletedPiles),
      const DeepCollectionEquality().hash(_undoPlayColumns),
      gameIsWon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      __$$AppStateDataImplCopyWithImpl<_$AppStateDataImpl>(this, _$identity);
}

abstract class _AppStateData implements AppStateData {
  factory _AppStateData(
      {final List<List<CardData>> completedPiles,
      final List<List<CardData>> playColumns,
      final List<List<CardData>> undoCompletedPiles,
      final List<List<CardData>> undoPlayColumns,
      final bool gameIsWon}) = _$AppStateDataImpl;

  @override
  List<List<CardData>> get completedPiles;
  @override
  List<List<CardData>> get playColumns;
  @override
  List<List<CardData>> get undoCompletedPiles;
  @override
  List<List<CardData>> get undoPlayColumns;
  @override
  bool get gameIsWon;
  @override
  @JsonKey(ignore: true)
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

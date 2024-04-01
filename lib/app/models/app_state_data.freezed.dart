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
  List<List<CardData>> get freecells => throw _privateConstructorUsedError;
  List<List<CardData>> get completedPiles => throw _privateConstructorUsedError;
  List<List<CardData>> get playColumns => throw _privateConstructorUsedError;

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
      {List<List<CardData>> freecells,
      List<List<CardData>> completedPiles,
      List<List<CardData>> playColumns});
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
    Object? freecells = null,
    Object? completedPiles = null,
    Object? playColumns = null,
  }) {
    return _then(_value.copyWith(
      freecells: null == freecells
          ? _value.freecells
          : freecells // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      completedPiles: null == completedPiles
          ? _value.completedPiles
          : completedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      playColumns: null == playColumns
          ? _value.playColumns
          : playColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
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
      {List<List<CardData>> freecells,
      List<List<CardData>> completedPiles,
      List<List<CardData>> playColumns});
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
    Object? freecells = null,
    Object? completedPiles = null,
    Object? playColumns = null,
  }) {
    return _then(_$AppStateDataImpl(
      freecells: null == freecells
          ? _value._freecells
          : freecells // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      completedPiles: null == completedPiles
          ? _value._completedPiles
          : completedPiles // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
      playColumns: null == playColumns
          ? _value._playColumns
          : playColumns // ignore: cast_nullable_to_non_nullable
              as List<List<CardData>>,
    ));
  }
}

/// @nodoc

class _$AppStateDataImpl implements _AppStateData {
  _$AppStateDataImpl(
      {final List<List<CardData>> freecells = const [],
      final List<List<CardData>> completedPiles = const [],
      final List<List<CardData>> playColumns = const []})
      : _freecells = freecells,
        _completedPiles = completedPiles,
        _playColumns = playColumns;

  final List<List<CardData>> _freecells;
  @override
  @JsonKey()
  List<List<CardData>> get freecells {
    if (_freecells is EqualUnmodifiableListView) return _freecells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_freecells);
  }

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

  @override
  String toString() {
    return 'AppStateData(freecells: $freecells, completedPiles: $completedPiles, playColumns: $playColumns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._freecells, _freecells) &&
            const DeepCollectionEquality()
                .equals(other._completedPiles, _completedPiles) &&
            const DeepCollectionEquality()
                .equals(other._playColumns, _playColumns));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_freecells),
      const DeepCollectionEquality().hash(_completedPiles),
      const DeepCollectionEquality().hash(_playColumns));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      __$$AppStateDataImplCopyWithImpl<_$AppStateDataImpl>(this, _$identity);
}

abstract class _AppStateData implements AppStateData {
  factory _AppStateData(
      {final List<List<CardData>> freecells,
      final List<List<CardData>> completedPiles,
      final List<List<CardData>> playColumns}) = _$AppStateDataImpl;

  @override
  List<List<CardData>> get freecells;
  @override
  List<List<CardData>> get completedPiles;
  @override
  List<List<CardData>> get playColumns;
  @override
  @JsonKey(ignore: true)
  _$$AppStateDataImplCopyWith<_$AppStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CardData {
  int get id => throw _privateConstructorUsedError;
  Suits get suit => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  int? get lastColumnIndex => throw _privateConstructorUsedError;
  bool get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardDataCopyWith<CardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardDataCopyWith<$Res> {
  factory $CardDataCopyWith(CardData value, $Res Function(CardData) then) =
      _$CardDataCopyWithImpl<$Res, CardData>;
  @useResult
  $Res call(
      {int id, Suits suit, int value, int? lastColumnIndex, bool isExpanded});
}

/// @nodoc
class _$CardDataCopyWithImpl<$Res, $Val extends CardData>
    implements $CardDataCopyWith<$Res> {
  _$CardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? suit = null,
    Object? value = null,
    Object? lastColumnIndex = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      suit: null == suit
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suits,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      lastColumnIndex: freezed == lastColumnIndex
          ? _value.lastColumnIndex
          : lastColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardDataImplCopyWith<$Res>
    implements $CardDataCopyWith<$Res> {
  factory _$$CardDataImplCopyWith(
          _$CardDataImpl value, $Res Function(_$CardDataImpl) then) =
      __$$CardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, Suits suit, int value, int? lastColumnIndex, bool isExpanded});
}

/// @nodoc
class __$$CardDataImplCopyWithImpl<$Res>
    extends _$CardDataCopyWithImpl<$Res, _$CardDataImpl>
    implements _$$CardDataImplCopyWith<$Res> {
  __$$CardDataImplCopyWithImpl(
      _$CardDataImpl _value, $Res Function(_$CardDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? suit = null,
    Object? value = null,
    Object? lastColumnIndex = freezed,
    Object? isExpanded = null,
  }) {
    return _then(_$CardDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      suit: null == suit
          ? _value.suit
          : suit // ignore: cast_nullable_to_non_nullable
              as Suits,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      lastColumnIndex: freezed == lastColumnIndex
          ? _value.lastColumnIndex
          : lastColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CardDataImpl implements _CardData {
  _$CardDataImpl(
      {required this.id,
      required this.suit,
      required this.value,
      this.lastColumnIndex = null,
      this.isExpanded = false});

  @override
  final int id;
  @override
  final Suits suit;
  @override
  final int value;
  @override
  @JsonKey()
  final int? lastColumnIndex;
  @override
  @JsonKey()
  final bool isExpanded;

  @override
  String toString() {
    return 'CardData(id: $id, suit: $suit, value: $value, lastColumnIndex: $lastColumnIndex, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.suit, suit) || other.suit == suit) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.lastColumnIndex, lastColumnIndex) ||
                other.lastColumnIndex == lastColumnIndex) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, suit, value, lastColumnIndex, isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardDataImplCopyWith<_$CardDataImpl> get copyWith =>
      __$$CardDataImplCopyWithImpl<_$CardDataImpl>(this, _$identity);
}

abstract class _CardData implements CardData {
  factory _CardData(
      {required final int id,
      required final Suits suit,
      required final int value,
      final int? lastColumnIndex,
      final bool isExpanded}) = _$CardDataImpl;

  @override
  int get id;
  @override
  Suits get suit;
  @override
  int get value;
  @override
  int? get lastColumnIndex;
  @override
  bool get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$CardDataImplCopyWith<_$CardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

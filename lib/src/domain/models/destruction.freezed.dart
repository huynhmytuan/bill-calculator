// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'destruction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Destruction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DestructionCopyWith<Destruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestructionCopyWith<$Res> {
  factory $DestructionCopyWith(
          Destruction value, $Res Function(Destruction) then) =
      _$DestructionCopyWithImpl<$Res, Destruction>;
  @useResult
  $Res call({String id, String title, double amount});
}

/// @nodoc
class _$DestructionCopyWithImpl<$Res, $Val extends Destruction>
    implements $DestructionCopyWith<$Res> {
  _$DestructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DestructionImplCopyWith<$Res>
    implements $DestructionCopyWith<$Res> {
  factory _$$DestructionImplCopyWith(
          _$DestructionImpl value, $Res Function(_$DestructionImpl) then) =
      __$$DestructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, double amount});
}

/// @nodoc
class __$$DestructionImplCopyWithImpl<$Res>
    extends _$DestructionCopyWithImpl<$Res, _$DestructionImpl>
    implements _$$DestructionImplCopyWith<$Res> {
  __$$DestructionImplCopyWithImpl(
      _$DestructionImpl _value, $Res Function(_$DestructionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
  }) {
    return _then(_$DestructionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DestructionImpl implements _Destruction {
  const _$DestructionImpl(
      {required this.id, required this.title, required this.amount});

  @override
  final String id;
  @override
  final String title;
  @override
  final double amount;

  @override
  String toString() {
    return 'Destruction(id: $id, title: $title, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DestructionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DestructionImplCopyWith<_$DestructionImpl> get copyWith =>
      __$$DestructionImplCopyWithImpl<_$DestructionImpl>(this, _$identity);
}

abstract class _Destruction implements Destruction {
  const factory _Destruction(
      {required final String id,
      required final String title,
      required final double amount}) = _$DestructionImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$DestructionImplCopyWith<_$DestructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

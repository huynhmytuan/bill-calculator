// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Invoice {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  Person get paidBy => throw _privateConstructorUsedError;
  List<Expense> get expenses => throw _privateConstructorUsedError;
  List<Destruction> get destructions => throw _privateConstructorUsedError;
  List<Person> get participants => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime date,
      Person paidBy,
      List<Expense> expenses,
      List<Destruction> destructions,
      List<Person> participants});

  $PersonCopyWith<$Res> get paidBy;
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? paidBy = null,
    Object? expenses = null,
    Object? destructions = null,
    Object? participants = null,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidBy: null == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as Person,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      destructions: null == destructions
          ? _value.destructions
          : destructions // ignore: cast_nullable_to_non_nullable
              as List<Destruction>,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Person>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PersonCopyWith<$Res> get paidBy {
    return $PersonCopyWith<$Res>(_value.paidBy, (value) {
      return _then(_value.copyWith(paidBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime date,
      Person paidBy,
      List<Expense> expenses,
      List<Destruction> destructions,
      List<Person> participants});

  @override
  $PersonCopyWith<$Res> get paidBy;
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? paidBy = null,
    Object? expenses = null,
    Object? destructions = null,
    Object? participants = null,
  }) {
    return _then(_$InvoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      paidBy: null == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as Person,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
      destructions: null == destructions
          ? _value._destructions
          : destructions // ignore: cast_nullable_to_non_nullable
              as List<Destruction>,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<Person>,
    ));
  }
}

/// @nodoc

class _$InvoiceImpl implements _Invoice {
  _$InvoiceImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.paidBy,
      final List<Expense> expenses = const [],
      final List<Destruction> destructions = const [],
      final List<Person> participants = const []})
      : _expenses = expenses,
        _destructions = destructions,
        _participants = participants;

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime date;
  @override
  final Person paidBy;
  final List<Expense> _expenses;
  @override
  @JsonKey()
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<Destruction> _destructions;
  @override
  @JsonKey()
  List<Destruction> get destructions {
    if (_destructions is EqualUnmodifiableListView) return _destructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destructions);
  }

  final List<Person> _participants;
  @override
  @JsonKey()
  List<Person> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'Invoice(id: $id, title: $title, description: $description, date: $date, paidBy: $paidBy, expenses: $expenses, destructions: $destructions, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.paidBy, paidBy) || other.paidBy == paidBy) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality()
                .equals(other._destructions, _destructions) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      date,
      paidBy,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_destructions),
      const DeepCollectionEquality().hash(_participants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);
}

abstract class _Invoice implements Invoice {
  factory _Invoice(
      {required final String id,
      required final String title,
      required final String? description,
      required final DateTime date,
      required final Person paidBy,
      final List<Expense> expenses,
      final List<Destruction> destructions,
      final List<Person> participants}) = _$InvoiceImpl;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get date;
  @override
  Person get paidBy;
  @override
  List<Expense> get expenses;
  @override
  List<Destruction> get destructions;
  @override
  List<Person> get participants;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

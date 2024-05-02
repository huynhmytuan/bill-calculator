import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  const factory Person({
    required String id,
    required String name,
    required Color color,
  }) = _Person;

  /// This is a factory constructor that allows you to create a Person instance
  /// with a random id.
  factory Person.raw({
    required String name,
    Color? color,
  }) {
    return Person(
      id: const Uuid().v4(),
      name: name,
      color: color ?? Colors.primaries.first,
    );
  }
}

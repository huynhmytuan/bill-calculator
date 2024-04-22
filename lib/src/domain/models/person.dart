import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Person extends Equatable {
  const Person({
    Uuid? id,
    required this.name,
    this.color = Colors.blue,
  }) : id = id ?? const Uuid();

  final Uuid id;
  final String name;
  final Color color;

  Person copyWith({
    Uuid? id,
    String? name,
    Color? color,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [id, name, color];
}

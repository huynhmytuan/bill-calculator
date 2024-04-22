import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Person extends Equatable {
  Person({
    String? id,
    required this.name,
    this.color = Colors.blue,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String name;
  final Color color;

  Person copyWith({
    String? id,
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

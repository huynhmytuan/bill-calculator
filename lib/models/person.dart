import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Person extends Equatable {
  const Person({
    required this.name,
    this.color = Colors.blue,
  }) : id = const Uuid();

  final Uuid id;
  final String name;
  final Color color;

  @override
  List<Object?> get props => [id, name];
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'destruction.freezed.dart';

@freezed
class Destruction with _$Destruction {
  const factory Destruction({
    required String id,
    required String title,
    required double amount,
  }) = _Destruction;
}

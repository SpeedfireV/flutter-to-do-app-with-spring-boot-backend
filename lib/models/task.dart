import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part "task.g.dart";

@freezed
class Task with _$Task {
  const factory Task(
      {required String title,
      required String description,
      required bool completed}) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

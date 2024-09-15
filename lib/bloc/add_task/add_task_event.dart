part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskEvent {}

final class AddTaskClicked extends AddTaskEvent {
  final String taskName;
  final String taskDescription;

  AddTaskClicked(this.taskName, this.taskDescription);
}

part of 'add_task_bloc.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskAddingTask extends AddTaskState {}

final class AddTaskFailedToAddTask extends AddTaskState {}

final class AddTaskAddedTask extends AddTaskState {}

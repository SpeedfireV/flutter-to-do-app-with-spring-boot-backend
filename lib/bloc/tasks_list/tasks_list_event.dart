part of 'tasks_list_bloc.dart';

@immutable
sealed class TasksListEvent {}

final class TasksListLoadTasks extends TasksListEvent {}

part of 'tasks_list_bloc.dart';

@immutable
sealed class TasksListState {}

final class TasksListInitial extends TasksListState {}

final class TasksListLoadingTasks extends TasksListState {}

final class TasksListLoadedTasks extends TasksListState {}

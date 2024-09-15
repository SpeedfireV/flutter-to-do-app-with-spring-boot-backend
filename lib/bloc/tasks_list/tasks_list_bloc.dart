import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tasks_list_event.dart';
part 'tasks_list_state.dart';

class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  TasksListBloc() : super(TasksListInitial()) {
    on<TasksListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

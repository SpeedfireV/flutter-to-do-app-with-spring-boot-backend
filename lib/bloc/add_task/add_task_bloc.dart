import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc() : super(AddTaskInitial()) {
    on<AddTaskClicked>((event, emit) {
      emit(AddTaskAddingTask());
      // TODO: Add Task Implementation
      Future.delayed(Duration(seconds: 5));
      if (event.taskName != "") {
        emit(AddTaskAddedTask());
      } else {
        emit(AddTaskFailedToAddTask());
      }
    });
  }
}

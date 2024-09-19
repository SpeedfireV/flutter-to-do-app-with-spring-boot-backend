import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';
import '../../services/to_do_list_service.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  final db = ToDoListService();
  RegisterPageBloc() : super(RegisterPageInitial()) {
    on<RegisterPageRegisterClicked>((event, emit) async {
      emit(RegisterPageCheckingCredentials(event.login, event.password));
      final User user = User(username: event.login, password: event.password);
      print("Status code: " + (await db.registerUser(user)).toString());

      if (event.login != "" && event.password != "") {
        emit(RegisterPageCredentialsApproved());
      } else {
        emit(RegisterPageCredentialsRejected());
      }
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
    print(stackTrace);
  }

  @override
  void onChange(Change<RegisterPageState> change) {
    super.onChange(change);
    print(change);
  }
}

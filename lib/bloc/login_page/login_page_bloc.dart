import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/models/user.dart';

import '../../services/to_do_list_service.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  final db = ToDoListService();
  LoginPageBloc() : super(LoginPageInitial()) {
    on<LoginPageSignInClicked>((event, emit) async {
      emit(LoginPageCheckingCredentials(event.login, event.password));
      final User user = User(username: event.login, password: event.password);
      print("Status code: " + (await db.loginUser(user)).toString());
      // TODO: Login Intergration
      if (event.login != "" && event.password != "") {
        emit(LoginPageCredentialsApproved());
      } else {
        emit(LoginPageCredentialsRejected());
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
  void onChange(Change<LoginPageState> change) {
    super.onChange(change);
    print(change);
  }
}

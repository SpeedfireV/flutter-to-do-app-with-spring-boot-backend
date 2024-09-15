import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageInitial()) {
    on<LoginPageSignInClicked>((event, emit) async {
      emit(LoginPageCheckingCredentials(event.login, event.password));
      // TODO: Login Intergration
      await Future.delayed(Duration(seconds: 5));
      if (event.login != "" && event.password != "") {
        emit(LoginPageCredentialsApproved());
      } else {
        emit(LoginPageCredentialsRejected());
      }
    });
  }
}

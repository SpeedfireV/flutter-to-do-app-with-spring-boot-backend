import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  RegisterPageBloc() : super(RegisterPageInitial()) {
    on<RegisterPageRegisterClicked>((event, emit) {
      emit(RegisterPageCheckingCredentials(event.login, event.password));
      // TODO: Register Implementation
      Future.delayed(Duration(seconds: 5));

      if (event.login != "" && event.password != "") {
        emit(RegisterPageCredentialsApproved());
      } else {
        emit(RegisterPageCredentialsRejected());
      }
    });
  }
}

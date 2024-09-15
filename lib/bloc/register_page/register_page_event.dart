part of 'register_page_bloc.dart';

@immutable
sealed class RegisterPageEvent {}

class RegisterPageRegisterClicked extends RegisterPageEvent {
  final String login;
  final String password;

  RegisterPageRegisterClicked(this.login, this.password);
}

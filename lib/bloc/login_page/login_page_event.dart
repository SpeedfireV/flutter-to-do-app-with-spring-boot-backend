part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageEvent {}

class LoginPageSignInClicked extends LoginPageEvent {
  final String login;
  final String password;

  LoginPageSignInClicked(this.login, this.password);
}

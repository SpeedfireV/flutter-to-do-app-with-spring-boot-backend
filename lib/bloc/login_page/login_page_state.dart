part of 'login_page_bloc.dart';

@immutable
sealed class LoginPageState {}

final class LoginPageInitial extends LoginPageState {}

final class LoginPageCheckingCredentials extends LoginPageState {
  final String username;
  final String password;

  LoginPageCheckingCredentials(this.username, this.password);
}

final class LoginPageCredentialsApproved extends LoginPageState {}

final class LoginPageCredentialsRejected extends LoginPageState {}

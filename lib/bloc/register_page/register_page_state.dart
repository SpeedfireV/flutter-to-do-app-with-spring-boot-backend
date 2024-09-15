part of 'register_page_bloc.dart';

@immutable
sealed class RegisterPageState {}

final class RegisterPageInitial extends RegisterPageState {}

final class RegisterPageCheckingCredentials extends RegisterPageState {
  final String username;
  final String password;

  RegisterPageCheckingCredentials(this.username, this.password);
}

final class RegisterPageCredentialsApproved extends RegisterPageState {}

final class RegisterPageCredentialsRejected extends RegisterPageState {}

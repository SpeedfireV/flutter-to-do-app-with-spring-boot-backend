import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_page_event.dart';
part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  RegisterPageBloc() : super(RegisterPageInitial()) {
    on<RegisterPageRegisterClicked>((event, emit) async {
      emit(RegisterPageCheckingCredentials(event.login, event.password));
      // TODO: Register Implementation
      await Future.delayed(Duration(seconds: 5));

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

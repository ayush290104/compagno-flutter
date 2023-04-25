import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_auth_event.dart';
part 'register_auth_state.dart';

class RegisterAuthBloc extends Bloc<RegisterAuthEvent, RegisterAuthState> {
  RegisterAuthBloc() : super(RegisterAuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      if (event is Register) {
        if (event.userName.isEmpty || event.password.isEmpty || event.confrimpassword.isEmpty || event.userNumber.isEmpty) {
          emit(RegisterAuthError());
        } else {
          emit(RegisterAuthLoading());
          await Future.delayed(const Duration(seconds: 3), () {

          });
        }
      }
    });
  }
}

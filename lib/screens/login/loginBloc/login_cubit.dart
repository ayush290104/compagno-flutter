part of 'login_bloc.dart';


abstract class LoginEvent {}

class Login extends LoginEvent {
  final String userEmail;
  final String password;

  Login(this.userEmail, this.password);
}
class ForgotPassEvent extends LoginEvent{}
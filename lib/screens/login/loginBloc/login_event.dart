part of 'bloc.dart';


abstract class AuthEvent {}

class Login extends AuthEvent {
  final String userName;
  final String password;

  Login(this.userName, this.password);
}

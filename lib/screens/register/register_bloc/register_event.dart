part of 'register_auth_bloc.dart';


abstract class RegisterAuthEvent {}

class Register extends RegisterAuthEvent {
  final String userName;
  final String userNumber;
  final String password;
  final String confrimpassword;

  Register(this.userName,this.userNumber, this.password, this.confrimpassword  );
}

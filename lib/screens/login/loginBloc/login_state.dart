

abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class FailedToLoginState extends LoginState{
  final String massage;
  FailedToLoginState({required this.massage});
}
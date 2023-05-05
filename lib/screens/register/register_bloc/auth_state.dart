
abstract class RegisterState{}

class RegisterInitialState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class FailedRegisterState extends RegisterState{
  String message;
  FailedRegisterState({required this.message});
}





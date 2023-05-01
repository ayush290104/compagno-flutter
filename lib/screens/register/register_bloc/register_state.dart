part of 'register_auth_bloc.dart';




abstract class RegisterAuthState {}

class RegisterAuthInitial extends RegisterAuthState {}

class RegisterAuthLoading extends RegisterAuthState {}

class RegisterAuthLoaded extends RegisterAuthState {
  final String username;
  final String userNumber;
  final String userPassword;
  final String userConfrimPassword;



  RegisterAuthLoaded(
    this.username,
      this.userNumber,
      this.userPassword,
      this.userConfrimPassword,
  );
}

class RegisterAuthError extends RegisterAuthState {}

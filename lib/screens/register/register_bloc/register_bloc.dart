// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'register_event.dart';
// part 'register_state.dart';
//
// class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
//   RegisterBloc() : super(RegisterInitial()) {
//     on<RegisterEvent>((event, emit) async {
//       if (event is Register) {
//         if (event.userName.isEmpty || event.userEmail.isEmpty || event.password.isEmpty || event.confrimpassword.isEmpty) {
//           emit(RegisterError(errorMsg: "Something went wrong"));
//         } else {
//           emit(RegisterLoading("loading"));
//           await Future.delayed(const Duration(seconds: 3), () {
//             emit(RegisterLoaded(event.userName, event.userEmail, event.password, event.confrimpassword));
//
//           });
//         }
//       }
//     });
//   }
// }

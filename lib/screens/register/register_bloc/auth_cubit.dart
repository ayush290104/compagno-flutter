import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:compagno4/screens/register/register_bloc/auth_state.dart';
import 'package:http/http.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

//  Register http | dio
  void register(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());
    Response response = await http
        .post(Uri.parse("https://compagno.app/api/register"), headers: {
      'lang': 'en'
    }, body: {
      'name': name,
      'email': email,
      'password': password,
    });
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] = true) {
      // emit success
      print(responseBody);
      if (responseBody["status_code"] == 200) {
        emit(RegisterSuccessState());
      } else {
        emit(FailedRegisterState(message: responseBody['data']['error']));
      }
    } else {
      //  failed
      print(responseBody);
      emit(FailedRegisterState(message: responseBody['data']['error']));
    }
  }
}

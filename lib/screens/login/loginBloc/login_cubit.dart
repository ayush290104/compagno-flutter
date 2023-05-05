
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());



  void login({required String email, required String password}) async {

    try{ Response response = await http.post(
      //request => url = base url + method url
      Uri.parse("https://compagno.app/api/login"),
      body: {
        'email' : email,
        'password' : password,
      },
    );
      if(response.statusCode ==200){
        var responseData = jsonDecode(response.body);
        if(responseData['status'] = true){
          debugPrint("User Login successfully: $responseData");
         await SaveId.insertToSave(key: 'token', value: responseData['data']['token']);

          print('user successfully login ');

          emit(LoginSuccessState());
        }
        else
        {
          debugPrint("Failed to login, some reason is: $responseData");
          print('Failed to login, some reason is ');

          emit(FailedToLoginState(massage: responseData['massage']));

        }
      }

    }catch(e){
      emit(FailedToLoginState(massage: e.toString()));

    }
  }
}
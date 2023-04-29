
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:compagno4/core/user_layout/user_mode_state.datr.dart';
import 'package:http/http.dart';

import '../../save_user/constants/constants.dart';

class UserModelCubit extends Cubit<UserModelState>{
  UserModelCubit() : super(UserInitialState());
UserData? userData;
  void getUserData()async{
    emit(GetUserDataLoadingState());
    Response response = await http.get(Uri.parse("https://compagno.app/api/me"),
    headers: {
      'Authorization' : token!,
      "lang": "en"
    });
    var responseData = jsonDecode(response.body);
    if(responseData['status'] = true){
      userData = UserData.fromJson(data: responseData['data'],);
      print('response is : $responseData');
      emit(GetUserDataSuccessState());

    }
    else{
      print('response is : $responseData');
      emit(GetUserDataFailedState(error: responseData['massage']));
    }

  }


}
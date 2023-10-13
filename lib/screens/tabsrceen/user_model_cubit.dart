
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/user_model.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:http/http.dart' as http;
import 'package:compagno4/screens/tabsrceen/user_mode_state.datr.dart';
import 'package:http/http.dart';

import '../../save_user/constants/constants.dart';

class UserModelCubit extends Cubit<UserModelState>{
  UserModelCubit() : super(UserInitialState());
 UserData? userData;
  void getUserData()async{
    emit(GetUserDataLoadingState());
    Response response = await http.get(Uri.parse("https://compagno.app/api/me"),
    headers: {
      'Authorization' : 'Bearer ${SaveId.getSaveData(key: token)}',
      "lang": "en"
    });
    var responseData = jsonDecode(response.body);
    if(responseData['status'] = true){
      userData = UserData.fromJson(user: responseData['data']['user'],);
      print('response is user model : ${responseData['data']}');
      emit(GetUserDataSuccessState());

    }
    else{
      print('response is user model: $responseData');
      emit(GetUserDataFailedState(error: responseData['massage']));
    }

  }


}
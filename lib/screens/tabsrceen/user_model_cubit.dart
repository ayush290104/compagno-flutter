
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/user_model.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/cupertino.dart';
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
  void updateUserProfile(Map<String, dynamic> updatedData) async {
    emit(UpdateUserDataLoadingState());
    try {
      // Convert the UserData object to a Map


      final response = await http.post(

        Uri.parse("https://compagno.app/api/edit-profile"), // Replace {{HOST_URL}} with your actual host URL
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${SaveId.getSaveData(key: token)}',
        },
        body: updatedData,

      );
      debugPrint("Updated data is while updating $updatedData");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        debugPrint("response data is ${response.body}");
        // userData = UserData.fromJson(user: responseData['data']['user']);
       // emit(UpdateUserDataSuccessState());
        // Optionally, you can trigger a getUserData() call here to refresh the user's data after the update.
         getUserData();
      } else {
        debugPrint("error while updating $updatedData");
        //emit(UpdateUserDataFailedState(error: 'Failed to update user data'));
      }
    } catch (error) {
      debugPrint("error while updating $error");
      //emit(UpdateUserDataFailedState(error: 'Failed to update user data: $error'));
    }
  }



}
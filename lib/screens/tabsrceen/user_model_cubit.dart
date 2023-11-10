
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import 'package:bloc/bloc.dart';
import 'package:compagno4/core/user_model.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:compagno4/screens/tabsrceen/user_mode_state.datr.dart';
import 'package:http/http.dart';

import '../../save_user/constants/constants.dart';
import '../settings/controller/BikeController.dart';

class UserModelCubit extends Cubit<UserModelState>{
  UserModelCubit() : super(UserInitialState());
 UserData? userData;

  bool isloading = false;
  int count = 0;
  void getUserData()async{

    emit(GetUserDataLoadingState());
    http.Response response = await http.get(Uri.parse("https://compagno.app/api/me"),
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
  Future<void> updateUserProfile(Map<String, dynamic> userData,File? image) async {
    isloading = true;

     emit(UpdateUserDataLoadingState());

    try {
      final request =  http.MultipartRequest(
        'POST',
        Uri.parse("https://compagno.app/api/edit-profile"), // Replace {{HOST_URL}} with your actual host URL
      );
      debugPrint("i am getting called");
      // Add headers
      request.headers['Accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer ${SaveId.getSaveData(key: token)}';

      // Add text fields (string parameters)
      request.fields['name'] = userData['name'];
      request.fields['email'] = userData['email'];

      request.fields['phone'] = userData['phone'];
      request.fields['address_line'] = userData['address_line'];
      debugPrint("i am getting called3");
      // Extract the profile picture from userData and add it as a file if it's not null
      if (image != null) {
        debugPrint("i am getting called4");
        final imageStream = http.ByteStream(Stream.castFrom(image.openRead()));
        final length = await image.length();

        final profilePic = http.MultipartFile(
          'profile_pic',
          imageStream,
          length,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        );
        debugPrint("i am getting called6");
        request.files.add(profilePic);
        debugPrint("i am getting called5");
      }
      debugPrint("i am getting called2");
         debugPrint("request sent is ${request.toString()}");
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      debugPrint("response data is ${response.body}");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        debugPrint("response data is ${response.body}");
        // userData = UserData.fromJson(user: responseData['data']['user']);
        isloading= false;
        count = 1;
        emit(UpdateUserDataSuccessState());
        // Optionally, you can trigger a getUserData() call here to refresh the user's data after the update.
        getUserData();
      } else {
        isloading= false;

        debugPrint("error while updating ${response.body}");
        emit(UpdateUserDataFailedState(error: 'Failed to update user data'));
      }
    } catch (error) {
      isloading = false;
      debugPrint("error while updating $error");
      emit(UpdateUserDataFailedState(error: 'Failed to update user data: $error'));
    }
  }



}
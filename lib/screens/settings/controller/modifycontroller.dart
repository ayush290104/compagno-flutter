import 'dart:io';

import 'package:get/get.dart';

import '../../../core/user_model.dart';



class ModifyController extends GetxController {

  Rx<UserData> user = Rx<UserData>(UserData());
  Rx<Map<String, dynamic>> userDataMap = Rx<Map<String, dynamic>>({
    'address_line': '',
    'phone': '',
    'email':'',
    'profile_pic':""
  });






}

import 'dart:ffi';
import 'dart:io';

import 'package:compagno4/Bikes/bike_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../Bikes/bike_model.dart';
import '../../../core/user_model.dart';



class BikeController extends GetxController {
  RxBool isloading = false.obs;
  Rx<BikeModel> bikemodel =Rx<BikeModel>(BikeModel(brand: "", modelName: "", image: File("")));
  RxList<BikeModel> listofbike = RxList<BikeModel>([]);
  Rx<BikeModel> bikeselect = Rx<BikeModel>(BikeModel(brand: '', modelName: "", image: "",));
  RxMap<String, dynamic> bikemodelMap = RxMap<String, dynamic>({
    "_method":"PUT",
    "rear_tire_psi":"0",
    "front_tire_psi":"0",
    "rear_shock_lsr":"",
    "rear_shock_hsr":"",
    "rear_shock_lsc":"",
    "rear_shock_hsc":"",
    "rear_shock_sag":"",
    "rear_shock_psi":"",
    "front_shock_lsr":"",
    "front_shock_hsr":"",
    "front_shock_lsc":"",
    "front_shock_hsc":"",
    "front_shock_sag":"",
    "front_shock_psi":"",
    "name":"",
    "model_name":""
  });
  RxInt count = 0.obs;
Bikeupdate(File? image)async{
  isloading.value = true;
  try{
    await BikeWeb().updatebikemodel(bikeselect.value.id!,bikemodelMap, image);
    count.value = 1;
  }
  catch(error){
    debugPrint("error is $error");
    count.value = 2;
  }


  isloading.value = false;
}

  GetListofbike() async {
   listofbike.value = await BikeWeb().getBikeModels();

 }

  Bikeadded(){
          BikeWeb().postBikeModel(bikemodel.value);
   }

}

import 'dart:ffi';
import 'dart:io';

import 'package:compagno4/Bikes/bike_web.dart';
import 'package:get/get.dart';

import '../../../Bikes/bike_model.dart';
import '../../../core/user_model.dart';



class BikeController extends GetxController {

  Rx<BikeModel> bikemodel =Rx<BikeModel>(BikeModel(brand: "", modelName: "", image: File("")));
  RxList<BikeModel> listofbike = RxList<BikeModel>([]);
  Rx<BikeModel> bikeselect = Rx<BikeModel>(BikeModel(brand: '', modelName: "", image: "",));
  GetListofbike() async {
   listofbike.value = await BikeWeb().getBikeModels();

 }

  Bikeadded(){
          BikeWeb().postBikeModel(bikemodel.value);
   }

}

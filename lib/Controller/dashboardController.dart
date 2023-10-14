import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../core/network/app_api.dart';
class DashboardController extends GetxController {
  RxString address = "Please Wait".obs;


  Future getAddressFromLatLng(LatLng location) async {
    const apiKey = 'AIzaSyD6zLsfMk3jv6bydjtXy5hXxk7nD-y-rzg'; // Replace with your Google Maps API key
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'OK') {
        address.value = data['results'][0]['formatted_address'];
      } else {
        address.value =  'Address not found';
       debugPrint("value is data address : $data");
      }
    } else {
      address.value = 'Error retrieving address';
    }
  }


}

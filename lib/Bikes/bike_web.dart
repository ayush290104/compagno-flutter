import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../save_user/constants/constants.dart';
import '../save_user/network/local_save.dart';
import 'package:http_parser/http_parser.dart';
import 'bike_model.dart';


class BikeWeb {
  final String baseUrl = "https://compagno.app";



Future<void> updatebikemodel(int index,Map<String,dynamic> bike,File? image) async{
  final Uri url = Uri.parse("https://compagno.app/api/bikes/$index");

  // Create a multipart request
  final request = http.MultipartRequest('POST', url);
debugPrint("hello bike data is ${bike}");
  // Set authorization header
  request.headers['Authorization'] = 'Bearer ${SaveId.getSaveData(key: token)}';

  // Add fields from the map
  bike.forEach((key, value) {
    request.fields[key] = value.toString();
  });
  debugPrint(request.toString());
  if (image != null) {
    final imageStream = http.ByteStream(image.openRead());
    final length = await image.length();

    final imageUpload = http.MultipartFile('image', imageStream, length,
        filename: image.path.split("/").last);

    request.files.add(imageUpload);
  }

  final response = await request.send();
  final responseStream = await response.stream.bytesToString();
  debugPrint("${responseStream}");

  if (response.statusCode == 200) {
    debugPrint("updated bike");
    }
   else {
    print('Failed to fetch bikes. Status code: ${response.statusCode}');
  //  print('Response: ${response.body}');
    throw Exception('Failed to fetch bikes');
  }



}


  Future<void> postBikeModel(BikeModel bikeModel) async {
    final Uri url = Uri.parse('https://compagno.app/api/bikes'); // Replace with your API endpoint.
    final String customHeaderKey = 'Authorization';
    final String customHeaderValue = 'Bearer ${SaveId.getSaveData(key: token)}';

    try {
      final request = http.MultipartRequest('POST', url);

      // Add text fields
      request.fields['brand'] = bikeModel.brand;
      request.fields['model_name'] = bikeModel.modelName;

      if (bikeModel.frontShockPsi != null) {
        request.fields['front_shock_psi'] = bikeModel.frontShockPsi!;
      }

      if (bikeModel.frontShockSag != null) {
        request.fields['front_shock_sag'] = bikeModel.frontShockSag!;
      }

      if (bikeModel.frontShockHsc != null) {
        request.fields['front_shock_hsc'] = bikeModel.frontShockHsc!;
      }

      if (bikeModel.frontShockLsc != null) {
        request.fields['front_shock_lsc'] = bikeModel.frontShockLsc!;
      }

      if (bikeModel.frontShockHsr != null) {
        request.fields['front_shock_hsr'] = bikeModel.frontShockHsr!;
      }

      if (bikeModel.frontShockLsr != null) {
        request.fields['front_shock_lsr'] = bikeModel.frontShockLsr!;
      }

      if (bikeModel.rearShockPsi != null) {
        request.fields['rear_shock_psi'] = bikeModel.rearShockPsi!;
      }

      if (bikeModel.rearShockSag != null) {
        request.fields['rear_shock_sag'] = bikeModel.rearShockSag!;
      }

      if (bikeModel.rearShockHsc != null) {
        request.fields['rear_shock_hsc'] = bikeModel.rearShockHsc!;
      }

      if (bikeModel.rearShockLsc != null) {
        request.fields['rear_shock_lsc'] = bikeModel.rearShockLsc!;
      }

      if (bikeModel.rearShockHsr != null) {
        request.fields['rear_shock_hsr'] = bikeModel.rearShockHsr!;
      }

      if (bikeModel.rearShockLsr != null) {
        request.fields['rear_shock_lsr'] = bikeModel.rearShockLsr!;
      }

      if (bikeModel.frontTirePsi != null) {
        request.fields['front_tire_psi'] = bikeModel.frontTirePsi.toString();
      }

      if (bikeModel.rearTirePsi != null) {
        request.fields['rear_tire_psi'] = bikeModel.rearTirePsi.toString();
      }

      request.headers[customHeaderKey] = customHeaderValue;

      // Add the image
      final imageStream = http.ByteStream(Stream.castFrom(bikeModel.image.openRead()));
      final length = await bikeModel.image.length();

      final multipartFile = http.MultipartFile(
        'image',
        imageStream,
        length,
        filename: bikeModel.image.path.split('/').last,
        contentType: MediaType('image', 'jpeg'),
      );

      request.files.add(multipartFile);

      final response = await request.send();
      if (response.statusCode == 200) {
        print('Bike model uploaded successfully.');
      } else {
        print('Error uploading bike model: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<List<BikeModel>> getBikeModels() async {
    final apiUrl = '$baseUrl/api/bikes';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer ${SaveId.getSaveData(key: token)}',
      },
    );

    debugPrint("reached here ${response.body}");

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['data'];

      // Create a list of BikeModel objects from the data
      final List<BikeModel> bikeModels = data.map((json) {
        return BikeModel.fromJson(json);
      }).toList();

      return bikeModels; // Return the list of BikeModel objects
    } else {
      print('Failed to fetch bikes. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to fetch bikes');
    }
  }

}

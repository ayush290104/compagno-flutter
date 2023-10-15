import 'dart:convert';
import 'package:http/http.dart' as http;

import '../save_user/constants/constants.dart';
import '../save_user/network/local_save.dart';
import 'bike_model.dart';

class BikeWeb {
  final String baseUrl = "https://compagno.app";



  Future<void> postBikeModel(BikeModel bike) async {
    final apiUrl = '$baseUrl/api/bikes';

    final response = await http.post(
      Uri.parse(apiUrl),

      headers: <String, String>{
    "Authorization": "Bearer ${SaveId.getSaveData(key: token)}",
        'Content-Type': 'application/json',

      },
      body: jsonEncode(bike.toJson()),
    );

    if (response.statusCode == 201) {
      print('Bike added successfully ${response.body}');
    } else {
      print('Failed to add bike. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to add bike');
    }
  }

  Future<List<BikeModel>> getBikeModels() async {
    final apiUrl = '$baseUrl/api/bikes';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => BikeModel.fromJson(json)).toList();
    } else {
      print('Failed to fetch bikes. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to fetch bikes');
    }
  }
}

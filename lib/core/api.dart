import 'package:compagno4/core/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  final String _url = "https://compagno.app/api/";
  postData(data, apiUrl)async{
    var fullUrl = _url + apiUrl;
   return await http.post(Uri.parse(fullUrl),
    body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
// Future<LoginResponseModel>login(LoginRequestModel requestModel)async{
  //   String uri = "https://compagno.app/api/login";
  //   final response = await http.post(uri as Uri, body: requestModel.toJson() );
  //   if(response.statusCode == 200 || response.statusCode == 400){
  //     return LoginResponseModel.fromJson(json.decode(response.body));
  //
  //   }
  //   else{
  //     throw Exception('Failed to load Data');
  //   }
  //
  // }

}



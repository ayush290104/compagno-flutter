
// import 'dart:convert';
//
// import 'package:compagno4/core/user_model.dart';
// import 'package:http/http.dart';
//
// class UserRepository{
//   String bikes = '';
//   getUser()async {
//     Response response = await get(Uri.parse(bikes));
//     if(response.statusCode ==200){
//       final List result = jsonDecode(response.body)['data'];
//       return result.map(((e) => UserModel.fromJson(e))).toString();
//
//
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
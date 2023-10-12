import 'package:compagno4/core/network/app_api.dart';
import 'package:compagno4/core/network/dio_client.dart';
import 'package:compagno4/core/network/error_handler.dart';
import 'package:compagno4/screens/login/model/login_request_model.dart';
import 'package:compagno4/screens/login/model/login_response.dart';
import 'package:dartz/dartz.dart';

class LoginWS {
  final _dioClient = DioClient.instance;

  EitherSuccess<LoginResponse> login(String email, String password) async {
    try {
      final model = LoginRequestModel(email: email, password: password).toMap();
      final response =
          await _dioClient.post(AppApi.login, body: model);
      final parsedResponse = LoginResponse.fromJson(response.data);
      if (parsedResponse.status) {
        return right(parsedResponse);
      }
      return left((parsedResponse.data?.error?? "").toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}

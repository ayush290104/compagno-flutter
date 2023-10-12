import 'package:compagno4/core/network/app_api.dart';
import 'package:compagno4/core/network/dio_client.dart';
import 'package:compagno4/core/network/error_handler.dart';
import 'package:compagno4/screens/register/model/register_model.dart';
import 'package:compagno4/screens/register/model/register_request_model.dart';
import 'package:dartz/dartz.dart';

class RegisterWS {
  final _dioClient = DioClient.instance;

  EitherSuccess<RegisterResponse> register(
      String email, String password, String name) async {
    try {
      final model =
          RegisterRequestModel(email: email, password: password, name: name)
              .toMap();
      final response = await _dioClient.post(AppApi.register, body: model);
      final parsedResponse = RegisterResponse.fromJson(response.data);
      if (parsedResponse.status ?? false) {
        return right(parsedResponse);
      }
      return left((parsedResponse.data?.error ?? "").toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}

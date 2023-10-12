import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/screens/login/model/login_response.dart';
import 'package:compagno4/screens/login/webservices/login_ws.dart';
import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  final loginWS = LoginWS();

  String? _email;
  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(
      {required Function(String) onError,
      required Function(LoginResponse) onSuccess}) async {
    try {
      isLoading = true;
      final response = await loginWS.login(_email!, _password!);
      response.fold((l) => onError.call(l), (r) {
        SaveId.insertToSave(key: token, value: r.data?.token ?? '');
        return onSuccess.call(r);
      });
    } finally {
      isLoading = false;
    }
  }
}

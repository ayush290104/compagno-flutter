import 'package:compagno4/save_user/constants/constants.dart';
import 'package:compagno4/save_user/network/local_save.dart';
import 'package:compagno4/screens/register/model/register_model.dart';
import 'package:compagno4/screens/register/webservices/register_ws.dart';
import 'package:flutter/material.dart';

class RegisterVM extends ChangeNotifier {
  final registerWS = RegisterWS();

  String? _email;
  String? get email => _email;
  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  String? _name;
  String? get name => _name;
  set name(String? value) {
    _name = value;
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

  Future<void> register(
      {required Function(String) onError,
      required Function(RegisterResponse) onSuccess}) async {
    try {
      isLoading = true;
      final response = await registerWS.register(_email!, _password!, _name!);
      response.fold((l) => onError.call(l), (r) {
        SaveId.insertToSave(key: token, value: r.data?.token ?? '');
        debugPrint("r.data?.token${SaveId.getSaveData(key: token)}");
        return onSuccess.call(r);
      });
    } finally {
      isLoading = false;
    }
  }
}

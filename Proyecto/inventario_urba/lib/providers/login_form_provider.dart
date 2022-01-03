import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool _isObscure = true;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  bool _isloading = false;
  bool get isLoading => _isloading;
  set isLoading(bool value) {
    _isloading = value;

    notifyListeners();
  }

  bool get isObscure => _isObscure;
  set isObscure(bool value) {
    _isObscure = value;

    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}

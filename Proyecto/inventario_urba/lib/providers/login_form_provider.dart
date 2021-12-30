import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isObscure = true;
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  bool isloading = false;
  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }
}

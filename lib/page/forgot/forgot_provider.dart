import 'package:flutter/material.dart';
import 'package:sushi/model/forgot_model.dart';

class ForgotPasswordProvider extends ChangeNotifier {

  ForgotPasswordModel forgotPassword = ForgotPasswordModel();


  void onSaveUserEmail(String? value) {
    forgotPassword.email = value ?? "";
  }

  String? validateUserEmail(String? value) {
    forgotPassword.email = value ?? "";
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "please enter your user Email";
    } else if (value.length < 4) {
      return "Email length must be 3 or long";
    } else if (!regExp.hasMatch(value)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }



  void onSubmit() {
    print({"${forgotPassword.email}"});
  }
}
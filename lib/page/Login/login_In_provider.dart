import 'package:flutter/material.dart';
import 'package:sushi/model/signInUser.dart';

class LoginInProvider extends ChangeNotifier {
  UserIn user = UserIn();

  void onSaveUsername(String? value) {
    user.email = value ?? "";
  }

  void onSavedPassword(String? value) {
    user.password = value ?? "";
    // print (password);
  }

  void onChancedPassword(String value) {
    user.password = value;
  }


  String? validateUsername(String? value) {
    user.email = value ?? "";
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

  String? validatePassword(String? value) {
    user.password = value!;
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 3) {
      return "Passwrod length must be 3 character or long";
    } else if (value.length > 16) {
      return "Password length must be 16 character or less";
    } else {
      return null;
    }
  }


  void onSubmit() {
    print({"${user.email}, ${user.password}"});
  }


}
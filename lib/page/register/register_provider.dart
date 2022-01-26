import 'package:flutter/material.dart';
import 'package:sushi/model/register_model.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterModel registerModel = RegisterModel();

  void onSaveUserEmail(String? value) {
    registerModel.email = value ?? "";
  }
  void onSaveUserName(String? value) {
    registerModel.name = value ?? "";
  }

  void onSavedPassword(String? value) {
    registerModel.password = value ?? "";
  }
  void onSavedPhoneNumber(String? value) {
    registerModel.phoneNumber = value ?? "";
  } void onSavedDateOfBirth(String? value) {
    registerModel.dateOfBirth = value ?? "";
  }

  void onChancedPassword(String value) {
    registerModel.password = value;
  }


  String? validateUserEmail(String? value) {
    registerModel.email = value ?? "";
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
  String? validatePhoneNumber(String? value) {
    registerModel.phoneNumber = value ?? "";
    if (value == null || value.isEmpty) {
      return "please enter your user PhoneNumber";
    } else if (value.length < 4) {
      return "Passwrod length must be 4 character or long";
    }else if (value.length >12) {
      return "Password length must be 12 character or less";
    } else {
      return null;
    }
  }
  String? validateDateOfBirth(String? value) {
    registerModel.dateOfBirth = value ?? "";
    if (value == null || value.isEmpty) {
      return "please enter your user DateOfBirth";
    } else if (value.length < 4) {
      return "DateOfBirth length must be 4 character or long";
    }else if (value.length >12) {
      return "DateOfBirth length must be 12 character or less";
    } else {
      return null;
    }
  }
  String? validateUserName(String? value) {
    registerModel.name = value ?? "";

    if (value == null || value.isEmpty) {
      return "please enter your user UserName";
    } else if (value.length < 4) {
      return "UserName length must be 4 or long";
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    registerModel.password = value!;
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


  void onSubmit(){
    print("${registerModel.email},${registerModel.password}, ${registerModel.confirmPassword}");
  }




}
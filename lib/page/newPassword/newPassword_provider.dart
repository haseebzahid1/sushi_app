
import 'package:flutter/cupertino.dart';
import 'package:sushi/model/new_password_model.dart';

class NewPasswordProvider extends ChangeNotifier{

  NewPasswordModel newPassword = NewPasswordModel();


  void onSavedPassword  (String? value) {
    newPassword.password = value ?? "";
    // print (password);
  }

  void onSaveConfirmPassword(String? value){
    newPassword.confirmPassword = value ?? "";
  }

  void onChancedPassword  (String value) {
    newPassword.password = value;
  }
  void onChangedConfirmPassword  (String value) {
    newPassword.confirmPassword = value;
  }



  String? validatePassword(String? value){
    newPassword.password = value ?? "";
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }else if(value.length<3){
      return "Passwrod length must be 3 character or long";
    } else if(value.length>16){
      return "Password length must be 16 character or less";
    }else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value){
    newPassword.confirmPassword = value ?? "";
    if(value==null  || value.isEmpty){
      return "Confirm password is required";
    }
    else if(value.length<3){
      return "password must 3 charactor or long";
    }else if(value.length>16) {
      return "Password length must be 16 character or less";
    } else if(newPassword.password != newPassword.confirmPassword){
      return "password not match";
    }

    return null;
  }

  void onSubmit(){
    print("${newPassword.password}, ${newPassword.confirmPassword}");
  }
/// Form provider End
}

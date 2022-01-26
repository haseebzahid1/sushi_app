import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/form_button.dart';
import 'package:sushi/widget/input_field.dart';
import 'package:sushi/widget/utils.dart';

import 'newPassword_provider.dart';


class NewPassword extends StatelessWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewPasswordProvider>(
      create: (context) => NewPasswordProvider(),
      child:  ForgotPasswordWidget(),
    );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final newPasswordProvider = Provider.of<NewPasswordProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/back.png",),fit: BoxFit.fill,
            alignment: Alignment.centerRight,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: size.height * 0.18,),
                  Image.asset("assets/images/logo.png",width: size.width * 0.57,),
                  SizedBox(height: size.height* 0.06,),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        children: [
                          const Text("Please Enter a new password\n and confirm the password",style: textHeading,textAlign: TextAlign.center,),
                          SizedBox(height: size.height* 0.04,),
                          InputFieldWidget(
                            initialValue: newPasswordProvider.newPassword.password ?? "1234567",
                            // hintText: "1234567",
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.https,color: kTextGrayColor,),
                            validate:newPasswordProvider.validatePassword,
                            onSaved: newPasswordProvider.onSavedPassword,
                            onChanged:newPasswordProvider.onChancedPassword ,
                          ),
                          SizedBox(height: size.height* 0.03,),
                          InputFieldWidget(
                            initialValue: newPasswordProvider.newPassword.confirmPassword ?? "1234567",
                            // hintText: "1234567",
                            labelText: "Confirm Password",
                            prefixIcon: const Icon(Icons.https,color: kTextGrayColor,),
                            validate:newPasswordProvider.validateConfirmPassword,
                            onSaved: newPasswordProvider.onSaveConfirmPassword,
                            onChanged:newPasswordProvider.onChangedConfirmPassword,
                          ),
                          SizedBox(height: size.height* 0.03,),
                          FormButton(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewPassword()));
                              newPasswordProvider.onSubmit();
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                Utils.showSnackBar(context, title: 'VALIDATION PASSED');
                              }else{
                                Utils.showSnackBar(context, title: 'VALIDATION Error');
                              }
                            },
                            textButton: "Submit",
                            width: size.width,
                            color: secondary,
                            bgcolor: bgButtonBlue,
                            size: 22,
                            padding:EdgeInsets.symmetric(vertical: 13),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


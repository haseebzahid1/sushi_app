import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/register/register_page.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/form_button.dart';
import 'package:sushi/widget/input_field.dart';
import 'package:sushi/widget/social_icon.dart';
import 'package:sushi/widget/utils.dart';

import 'login_In_provider.dart';

class LoginInPage extends StatelessWidget {
  const LoginInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginInProvider>(
      create: (context) =>LoginInProvider(),
      child: LoginInPageWidget(),
    );
  }
}

class LoginInPageWidget extends StatelessWidget {
   LoginInPageWidget({Key? key}) : super(key: key);

    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer registerHere = TapGestureRecognizer()..onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
      print("Register here");
    };
    final TapGestureRecognizer termsOfUse = TapGestureRecognizer()..onTap = (){
      print("Terms of Use");
    };
  final loginInProvider = Provider.of<LoginInProvider>(context);
  final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            decoration:  const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/back.png",),fit: BoxFit.fill,
                  alignment: Alignment.centerRight,
                )
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.18,),
                Image.asset("assets/images/logo.png",width: size.width * 0.57,),
                SizedBox(height: size.height* 0.06,),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
                    child: Column(
                      children: [
                        InputFieldWidget(
                          initialValue: loginInProvider.user.email??"Email@gmail.com",
                          // hintText: "Email@gmail.com",
                          labelText: "Email@gmail.com",
                          textInputType: TextInputType.emailAddress,
                          validate:loginInProvider.validateUsername,
                          onSaved: loginInProvider.onSaveUsername,
                          prefixIcon: const Icon(Icons.person,color: kTextGrayColor,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: loginInProvider.user.password ?? "1234567",
                          // hintText: "1234567",
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.https,color: kTextGrayColor,),
                          validate:loginInProvider.validatePassword,
                          onSaved: loginInProvider.onSavedPassword,
                          onChanged:loginInProvider.onChancedPassword ,
                        ),
                        SizedBox(height: size.height* 0.04,),
                        FormButton(
                          onTap: (){
                            loginInProvider.onSubmit();
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              Utils.showSnackBar(context, title: 'VALIDATION PASSED');
                            }else{
                              Utils.showSnackBar(context, title: 'VALIDATION Error');
                            }
                          },
                          textButton: "LOGIN",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Column(
                    children: [
                      Container(width: size.width,),
                      SizedBox(height: size.height* 0.03,),
                      GestureDetector(
                          onTap: (){print("forgot password?");},
                          child: const Text("ForGot Password ?",style: kPasswordTitle)
                      ),
                      SizedBox(height: size.height* 0.01,),
                      const Text("or",style: kOrTitle),
                      SizedBox(height: size.height* 0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialIcon(image: 'assets/icons/facebook.png',onTap: (){print("facebook");},),
                          SocialIcon(image: 'assets/icons/google.png',onTap: (){print("google");},),
                        ],
                      ),
                      SizedBox(height: size.height* 0.01,),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(text: 'New user  ',style: privacyHeadingStyle),
                            TextSpan(text: 'Register here \n', style: privacyHeadingStyle_2,recognizer: registerHere),
                            TextSpan(text: 'By singning up, your agree to our',style: privacyHeadingStyle.copyWith(height: 1.5)),
                            TextSpan(text: 'Terms of Use',style: privacyHeadingStyle_2.copyWith(height: 1.5),recognizer: termsOfUse),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.23,)
                    ],
                  ),
                ),
                // SizedBox(height: size.height * 0.15,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


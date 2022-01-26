import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/Login/Login_page.dart';
import 'package:sushi/page/register/register_provider.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/form_button.dart';
import 'package:sushi/widget/input_field.dart';
import 'package:sushi/widget/social_icon.dart';
import 'package:sushi/widget/utils.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (context) =>RegisterProvider(),
      child:  RegisterPageWidget(),
    );
  }
}

class RegisterPageWidget extends StatelessWidget {
   RegisterPageWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer registerHere = TapGestureRecognizer()..onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginInPage()));
      print("Login Here");
    };
    final TapGestureRecognizer termsOfUse = TapGestureRecognizer()..onTap = (){
      print("Terms of Use");
    };

    final registerProvider = Provider.of<RegisterProvider>(context);
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
                SizedBox(height: size.height* 0.04,),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  width: 120,height: 120,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          height: 30,width: 30,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: size.height* 0.03,),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
                    child: Column(
                      children: [
                        InputFieldWidget(
                          initialValue: registerProvider.registerModel.email??"Email@gmail.com",
                          // hintText: "Email@gmail.com",
                          labelText: "Email@gmail.com",
                          textInputType: TextInputType.emailAddress,
                          validate:registerProvider.validateUserEmail,
                          onSaved: registerProvider.onSaveUserEmail,
                          prefixIcon: const Icon(Icons.email,color: kTextGrayColor,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: registerProvider.registerModel.name??"John",
                          // hintText: "John",
                          labelText: "john",
                          validate:registerProvider.validateUserName,
                          onSaved: registerProvider.onSaveUserEmail,
                          prefixIcon: const Icon(Icons.email,color: kTextGrayColor,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: registerProvider.registerModel.phoneNumber??"00/00/0000",
                          // hintText: "John",
                          labelText: "Date Of Birth",
                          validate:registerProvider.validateDateOfBirth,
                          onSaved: registerProvider.onSavedDateOfBirth,
                          prefixIcon: const Icon(Icons.email,color: kTextGrayColor,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: registerProvider.registerModel.phoneNumber??"0312-1234567",
                          // hintText: "John",
                          labelText: "Phone Number",
                          validate:registerProvider.validatePhoneNumber,
                          onSaved: registerProvider.onSavedPhoneNumber,
                          prefixIcon: const Icon(Icons.phone,color: kTextGrayColor,),
                          isPassword: false,
                        ),
                        const SizedBox(height: 17,),
                        InputFieldWidget(
                          initialValue: registerProvider.registerModel.password ?? "1234567",
                          // hintText: "1234567",
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.https,color: kTextGrayColor,),
                          validate:registerProvider.validatePassword,
                          onSaved: registerProvider.onSavedPassword,
                          onChanged:registerProvider.onChancedPassword ,
                        ),
                        const SizedBox(height: 17,),
                        SizedBox(height: size.height* 0.03,),
                        FormButton(
                          onTap: (){
                            registerProvider.onSubmit();
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              Utils.showSnackBar(context, title: 'VALIDATION PASSED');
                            }else{
                              Utils.showSnackBar(context, title: 'VALIDATION Error');
                            }
                          },
                          textButton: "Sign Up",
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
                            TextSpan(text: 'New User',style: privacyHeadingStyle),
                            TextSpan(text: 'Login Here \n', style: privacyHeadingStyle_2,recognizer: registerHere),
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


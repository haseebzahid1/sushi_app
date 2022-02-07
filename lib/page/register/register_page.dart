import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/Login/Login_page.dart';
import 'package:sushi/page/register/register_provider.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/form_button.dart';
import 'package:sushi/widget/input_field.dart';
import 'package:sushi/widget/profile_widget.dart';
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


class RegisterPageWidget extends StatefulWidget {
  RegisterPageWidget({Key? key}) : super(key: key);

  @override
  State<RegisterPageWidget> createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer registerHere = TapGestureRecognizer()..onTap = (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginInPage()));
      print("Login Here");
    };
    final TapGestureRecognizer termsOfUse = TapGestureRecognizer()..onTap = (){
      print("Terms of Use");
    };

    DateTime date = DateTime(2022,12,24);
    final registerProvider = Provider.of<RegisterProvider>(context);
    final Size size  = MediaQuery.of(context).size;
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/back.png",),fit: BoxFit.fill,
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
                  SizedBox(height: size.height * 0.14,),
                  Image.asset("assets/images/logo.png",width: size.width * 0.50,),
                  SizedBox(height: size.height* 0.04,),
                  ProfileWidget(onClicked: () { },imagePath: "assets/images/22654-6-man.png",),
                  SizedBox(height: size.height* 0.03,),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(26, 0, 26, 0),
                      child: Column(
                        children: [
                          InputFieldWidget(
                            controller: email,
                            labelText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            validate:registerProvider.validateUserEmail,
                            onSaved: registerProvider.onSaveUserEmail,
                            prefixIcon: const Icon(Icons.email,),
                            isPassword: false,
                          ),
                          const SizedBox(height: 17,),
                          InputFieldWidget(
                            controller: name,
                            labelText: "Haseeb",
                            validate:registerProvider.validateUserName,
                            onSaved: registerProvider.onSaveUserEmail,
                            prefixIcon: const Icon(Icons.email),
                            isPassword: false,
                          ),
                          const SizedBox(height: 17,),
                          InputFieldWidget(
                            keyboardType: TextInputType.none,
                            onTab:() async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  _dateController.text =
                                      DateFormat('yyyy-MM-dd').format(selectedDate);
                                }
                              });
                            },
                            controller: _dateController,
                            // hintText: "John",
                            labelText: "Date Of Birth",
                            validate:registerProvider.validateDateOfBirth,
                            onSaved: registerProvider.onSavedDateOfBirth,
                            prefixIcon: const Icon(Icons.email,),
                            isPassword: false,
                          ),
                          const SizedBox(height: 17,),
                          InputFieldWidget(
                            keyboardType: TextInputType.number,
                            controller: phone,
                            // hintText: "John",
                            labelText: "Phone Number",
                            validate:registerProvider.validatePhoneNumber,
                            onSaved: registerProvider.onSavedPhoneNumber,
                            prefixIcon: const Icon(Icons.phone),
                            isPassword: false,
                          ),
                          const SizedBox(height: 17,),
                          InputFieldWidget(
                            controller: password,
                            // hintText: "1234567",
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.https),
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
                                print (_formKey.currentState!.validate());
                                Utils.showSnackBar(context, title: 'VALIDATION PASSED');
                              }else{
                                Utils.showSnackBar(context, title: 'VALIDATION Error');
                                print ("Validate error");
                              }

                            },
                            textButton: "Sign Up",
                            width: size.width * 0.8,
                            color: secondary,
                            bgcolor: bgButtonBlue,
                            size: 22,
                            padding:EdgeInsets.symmetric(vertical: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: size.width,),
                        SizedBox(height: size.height* 0.03,),
                        const Text("or",style: kOrTitle),
                        SizedBox(height: size.height* 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
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
                              TextSpan(text: 'New User ',style: viewallText),
                              TextSpan(text: 'Login Here ', style: privacyHeadingStyle_2,recognizer: registerHere,),
                              TextSpan(text: 'By singning up, your agree to our',style: viewallText.copyWith(height: 1.5,)),
                              TextSpan(text: 'Terms of Use',style: privacyHeadingStyle_2.copyWith(height: 1.5,),recognizer: termsOfUse),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.04,)
                      ],
                    ),
                  ),
                  // SizedBox(height: size.height * 0.15,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

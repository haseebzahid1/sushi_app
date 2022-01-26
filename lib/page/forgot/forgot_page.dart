import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/newPassword/newPassword.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/form_button.dart';
import 'package:sushi/widget/input_field.dart';
import 'package:sushi/widget/utils.dart';
import 'forgot_provider.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
      create: (context) => ForgotPasswordProvider(),
      child:  ForgotPasswordWidget(),
    );
  }
}

class ForgotPasswordWidget extends StatelessWidget {
   ForgotPasswordWidget({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context);
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
                  SizedBox(height: size.height * 0.22,),
                  Image.asset("assets/images/logo.png",width: size.width * 0.57,),
                  SizedBox(height: size.height* 0.06,),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Column(
                        children: [
                          SizedBox(height: size.height* 0.04,),
                          InputFieldWidget(
                            initialValue: forgotPasswordProvider.forgotPassword.email??"Email@gmail.com",
                            // hintText: "Email@gmail.com",
                            labelText: "Email@gmail.com",
                            textInputType: TextInputType.emailAddress,
                            validate:forgotPasswordProvider.validateUserEmail,
                            onSaved: forgotPasswordProvider.onSaveUserEmail,
                            prefixIcon: const Icon(Icons.person,color: kTextGrayColor,),
                            isPassword: false,
                          ),
                          SizedBox(height: size.height* 0.03,),
                          Text("Please Enter an email t send reset Password Instructions",style: textHeading,textAlign: TextAlign.center,),
                          SizedBox(height: size.height* 0.03,),
                          FormButton(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewPassword()));
                              forgotPasswordProvider.onSubmit();
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                Utils.showSnackBar(context, title: 'VALIDATION PASSED');
                              }else{
                                Utils.showSnackBar(context, title: 'VALIDATION Error');
                              }
                            },
                            textButton: "Send Email",
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

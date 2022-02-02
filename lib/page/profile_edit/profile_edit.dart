import 'package:flutter/material.dart';
import 'package:sushi/page/DetailPage/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/widget/custom_button.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Widget build(BuildContext context) {
    emailController.text = "jhondoe@gmail.com";
    fNameController.text = "jhon";
    lNameController.text = "jhon";
    dateController.text = "13/05/1997";
    phoneController.text = "+971 1541 1515";

    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("Edit Profile",style: kAppBarTitle,),
        // backgroundColor: Colors.lightBlue,
        // elevation: 0,
        actions:  [
          GestureDetector(
              onTap: (){
                print("Search");
              },
              child: Icon(Icons.search,color: Colors.black,)
          ),
          const SizedBox(width: 10,)
        ],
      ),
      drawer:const Drawer(
        // backgroundColor: Colors.transparent,
        child: MyDrawerList(),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            // padding: EdgeInsets.zero,
            children: [
               SizedBox(height: size.height * 0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                        child: Image.network("https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=388&q=80",fit: BoxFit.cover,)),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    container(title: 'Email'),
                    const SizedBox(height: 1,),
                    textFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: size.height * 0.02,),
                     container(title: 'First Name'),
                    const SizedBox(height: 1,),
                    textFormField(
                      controller: fNameController,
                      keyboardType:  TextInputType.text
                    ),
                    SizedBox(height: size.height * 0.02,),
                     container(title: 'Last Name'),
                    const SizedBox(height: 1,),
                    textFormField(
                      controller: lNameController,
                      keyboardType:  TextInputType.text
                    ),
                    SizedBox(height: size.height * 0.02,),
                     container(title: 'Date Of Birth'),
                    const SizedBox(height: 1,),
                    textFormField(
                      controller: dateController,
                      keyboardType:  TextInputType.number
                    ),
                    SizedBox(height: size.height * 0.02,),
                     container(title: 'Phone'),
                    const SizedBox(height: 1,),
                    textFormField(
                      controller: phoneController,
                      keyboardType:  TextInputType.number
                    ),
                    SizedBox(height: size.height * 0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(textButton: 'Update Profile',padding: EdgeInsets.symmetric(vertical: 14), width: size.width * 0.7, color: Colors.white, bgColor: Colors.blue,),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Container container({required String title}){
    return   Container(
    child: Text(title,
    style: const TextStyle(
    fontSize: 14,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    )),
  );
  }
  TextFormField textFormField({TextEditingController? controller,TextInputType? keyboardType}){
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration:  InputDecoration(
        border: underlineInputBorder(),
        enabledBorder: underlineInputBorder(),
        focusedBorder: underlineInputBorder(),
      ),
      style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  UnderlineInputBorder underlineInputBorder(){
    return const UnderlineInputBorder(
      borderSide:BorderSide(color:Color(0xFFC2C2C2),width: 1),
    );
  }
}

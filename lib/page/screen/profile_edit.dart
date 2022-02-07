import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sushi/page/screen/drawer_header.dart';
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
  TextEditingController _dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Widget build(BuildContext context) {
    emailController.text = "Haseeb@gmail.com";
    fNameController.text = "Haseeb";
    lNameController.text = "Haseeb";
    _dateController.text = "13/05/1997";
    phoneController.text = "+921 1541 1515";

    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("Edit Profile",style: kAppBarTitle,),
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
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(55),
                        child: Image.asset("assets/images/22654-6-man.png",fit: BoxFit.cover,))
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02,),
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
                      keyboardType: TextInputType.none,
                      onTap: () async {
                        await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1947),
                          lastDate: DateTime(2025),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            _dateController.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        });
                      },
                      controller: _dateController,
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
  Widget textFormField({TextEditingController? controller,TextInputType? keyboardType,Function()? onTap}){
    return TextFormField(
      onTap: onTap,
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

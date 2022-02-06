import 'package:flutter/material.dart';
import 'package:sushi/page/screen/about_us.dart';
import 'package:sushi/page/newPassword/newPassword.dart';
import 'package:sushi/page/screen/order_history.dart';
import 'package:sushi/page/screen/profile_edit.dart';
import 'package:sushi/style/constant.dart';

class MyDrawerList extends StatelessWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_edit_profile.png"),
          title: Text("Edit Profile",style: headingDrawerText,),
          trailing: Image.asset("assets/icons/ic_forward.png"),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileEditScreen()));
            },
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_password.png"),
          title: Text("Change Password",style: headingDrawerText,),
          trailing: Image.asset("assets/icons/ic_forward.png",color: Colors.black,),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewPassword()));
          },
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_history.png"),
          title: Text("Order History",style: headingDrawerText,),
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderHistory()));},
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_notification.png"),
          title: Text("Notification",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_privacy.png"),
          title: Text("Privacy Policy",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_terms.png"),
          title: Text("Terms of use",style: headingDrawerText,),
          onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutUsScreen()));},
        ),
        Container(width: size.width,height: 2,color: Color(0xFFC2C2C2),),
        ListTile(
          leading: Image.asset("assets/icons/ic_logout.png"),
          title: Text("Logout",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),

      ],
    );
  }
}

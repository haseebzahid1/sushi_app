import 'package:flutter/material.dart';
import 'package:sushi/page/newPassword/newPassword.dart';
import 'package:sushi/style/constant.dart';

class MyDrawerList extends StatelessWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("assets/icons/ic_edit_profile.png"),
          title:const Text("Edit Profile",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_password.png"),
          title:const Text("Change Password",style: headingDrawerText,),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewPassword()));
          },
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_history.png"),
          title:const Text("Order History",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),  ListTile(
          leading: Image.asset("assets/icons/ic_notification.png"),
          title:const Text("Notification",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_privacy.png"),
          title:const Text("Privacy Pllicy",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_terms.png"),
          title:const Text("Terms of use",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),
        ListTile(
          leading: Image.asset("assets/icons/ic_logout.png"),
          title:const Text("Logout",style: headingDrawerText,),
          onTap: (){Navigator.of(context).pop();},
        ),

      ],
    );
  }
}

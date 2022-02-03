import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/widget/custom_button.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              child: AppBar(
                leading: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.menu_sharp,
                      color: Colors.black,)),
                title: const Text("Invite Friends",
                  style: kAppBarTitle),
              ),
              preferredSize: const Size.fromHeight(50)),
          body: Column(
            children: [
               SizedBox(height: size.height * 0.06,),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Image.asset("assets/images/friend_img.png")),
              SizedBox(height: size.height * 0.06,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: DottedBorder(
                  color: Colors.blue,
                  strokeWidth: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Column(
                      children: [
                        const Text("6255",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                          ),),
                        Text("Click to Copy",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade400,
                          ),),
                      ],
                    ),
                  ),
                ),
              ),

              //Space
              const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Container(
                      child: const Text("Get Points for each friend",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                    const Spacer(),
                    Container(
                      child:  const Text("100",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700
                        ),),
                    ),
                    //Space
                    const SizedBox(width: 5,),
                    Image.asset("assets/icons/coin.png",scale: 4,)
                  ],
                ),
              ),
              //Space
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text("if a friend installs the app using your promo code and makes their first order",
                  style: TextStyle(fontSize: 14, color:  Colors.grey),
                ),
              ),
              //Space
               SizedBox(height: size.height * 0.04,),
              CustomButton(
                textButton: 'SHARE YOUR REFERRAL CODE',
                width:size.width * 0.72,color:Colors.white ,
                bgColor:Colors.blue,
                onTap:(){},
                size: 16,
                padding: const EdgeInsets.symmetric(vertical: 13),),
            ],
          ),
        ));
  }
}

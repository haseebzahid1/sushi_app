import 'package:flutter/material.dart';
import 'package:sushi/model/ProductList.dart';
import 'package:sushi/model/product_listView.dart';
import 'package:sushi/page/screen/invite_friends_screen.dart';
import 'package:sushi/page/screen/order_history.dart';
import 'package:sushi/page/screen/sliver_screen.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/bottom_GridContainer_widget.dart';
import 'package:sushi/widget/detailRowView_widget.dart';
import 'package:sushi/widget/gridContainer_widget.dart';
import 'bottom_model_sheet.dart';
import '../screen/drawer_header.dart';

class DetailPage extends StatefulWidget {
 const DetailPage({Key? key}) : super(key: key);


  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  @override

  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: size.width,
              height: size.height * 0.13,
              decoration: BoxDecoration(),
              // alignment: Alignment.topCenter,
              child: Image.asset("assets/icons/main-remove.png",fit: BoxFit.cover,)
          ),
          const SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            GridContainer(
                              title: 'Repeat Order',
                              subTitle: 'in one click',
                              color:blueColor,
                              image: "assets/icons/arrowCircle.png",
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderHistory()));
                              },
                            ),
                          ],
                        ),
                    ),
                    SizedBox(width: size.width * 0.03,),
                    Expanded(
                        child: Column(
                          children: [
                            GridContainer(
                              title: 'Ordere',
                              subTitle: 'and get Kanji Coins',
                              color:success,
                              image: "assets/icons/noodle.png",
                              onTap: ()=>showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                                  ),
                                  isScrollControlled: true,
                                  context: context, builder: (BuildContext context){
                                return  DetailBottomSheet();
                              }
                              )),

                          ],
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                width: size.width,
                height: size.height * 0.14,
                // height: size.height * 0.2,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                // color: Colors.red,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Container(

                        child: Image.asset("assets/icons/background.png",width: size.width,fit: BoxFit.cover, )),
                    Positioned(
                      top: 0,
                      bottom: 5,
                      right: size.width  * 0.14,
                      child: Container(
                          width: size.width * 0.20,
                          child: Image.asset("assets/icons/mobile-payment.png",color: Colors.white.withOpacity(0.1),)
                      ),
                    ),
                    // Container(color: Colors.blue.withOpacity(0.8),),
                    Positioned(
                      left:size.width * 0.14,
                      child: Container(
                          width: size.width * 0.15,
                          child: Image.asset("assets/icons/mobile-payment.png")
                      ),
                    ),

                    Positioned(
                      top: 30,
                      left:size.width * 0.33,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  const [
                          Text("Get Kanji Coins",style: detailPositionHeading,textAlign: TextAlign.center,),
                          SizedBox(height: 3,),
                          Text("For dine-in Orders",style: cardsmallTextstyle,textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                      decoration: BoxDecoration(
                      // color: Colors.red,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: Colors.lightBlue,
                        )
                      ),
                      child: Column(
                        children: const [
                          Text("0",style: detailZeroText,),
                          Text("Coins",style: detailTextHeading_2,),
                        ],
                      ),
                    ),
                    SizedBox(width: size.height * 0.02,),
                    const Text("Your Club Welcome Gift",style: detailClubHeading,),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              Container(
                width: size.width,
                height: size.height * 0.17,
                // color: Colors.red,
                child: Image.asset("assets/icons/image.png",fit: BoxFit.cover,width: size.width,height: size.height,),
              ),
              SizedBox(height: size.height * 0.02,),
              const Padding(
                padding: EdgeInsets.only(left: 36),
                child: Text("Free Crunchy Roll with Purchase",style: detailTextHeading,),
              ),
              SizedBox(height: size.height * 0.01,),
              const DetailRowView(title:"New For You",subTitle: '"View All (45)',),
              SizedBox(height: size.height * 0.01,),
              Container(
                height: size.height * 0.31,
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: productListView.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    ProductListView productListItem = productListView[index];
                    return Container(
                      padding: EdgeInsets.only(left:5,right: 5),
                      // color: Colors.grey,
                      width: size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.22,
                            child: Image.asset(productListItem.img,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 8),
                            child: Text(productListItem.title,style: detailTextHeading,),
                          ),
                        ],
                      ),
                    );
                  },),
              ),
              SizedBox(height: size.height * 0.01,),
              const DetailRowView(title:"Reward with kenji coins",subTitle: '"View All (35)',),
              SizedBox(height: size.height * 0.01,),
              Container(
                height: size.height * 0.27,
                child: ListView.builder(
                  itemCount: productList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    ProductList productItem = productList[index];
                    return Container(
                      padding: const EdgeInsets.only(left: 5,right: 10),
                      // color: Colors.grey,
                      width: size.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.2,
                            child: Image.asset(productItem.img,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0,right: 0),
                            child: Text(productItem.title,style: detailTextHeading,),
                          ),
                        ],
                      ),
                    );
                  },),
              ),
              SizedBox(height: size.height * 0.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children:  [
                          BottomGridContainer(
                            onTab: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SliversDemo()));
                            },
                            title: 'Thanks for visiting',
                            subTitle: "Leave  feedBack",
                            color:blueColor,
                            image: "assets/icons/message.png",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.03,),
                    Expanded(
                      child: Column(
                        children:   [
                          BottomGridContainer(
                            onTab: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InviteFriendsScreen()));
                            },
                            title: 'Invite Friends',
                            subTitle: "Refer a none friend and\n earn 100 kepi coins",
                            color:pupleColor,
                            image: "assets/icons/invitation.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ],
      ),
    );
  }

}

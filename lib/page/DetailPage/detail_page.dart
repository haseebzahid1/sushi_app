import 'package:flutter/material.dart';
import 'package:sushi/model/ProductList.dart';
import 'package:sushi/model/product_listView.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'package:sushi/widget/bottom_GridContainer_widget.dart';
import 'package:sushi/widget/detailRowView_widget.dart';
import 'package:sushi/widget/gridContainer_widget.dart';
import 'drawer_header.dart';

class DetailPage extends StatefulWidget {
   DetailPage({Key? key}) : super(key: key);


  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {
  @override
  int _currentIndex = -0;
  String _selectedItem = '';
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        elevation: 0,
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
              decoration: BoxDecoration(),
              alignment: Alignment.topCenter,
              child: Image.asset("assets/icons/main-remove.png",fit: BoxFit.fitWidth,)
          ),
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
                              color:Colors.blue.withOpacity(0.9),
                              image: "assets/icons/arrowCircle.png",
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
                                return  buildSheet_2();
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
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                // color: Colors.red,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/icons/background.png",width: size.width,fit: BoxFit.cover, ),
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
                        children: const [
                          Text("Get Kanji Coins",style: detailPositionHeading,textAlign: TextAlign.center,),
                          SizedBox(height: 3,),
                          Text("For dine-in Orders",style: detailPositionSubHeading,textAlign: TextAlign.center,),
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
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
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
                            padding: const EdgeInsets.only(left: 10,right: 8),
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
                            height: size.height * 0.19,
                            child: Image.asset(productItem.img,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: size.height * 0.01,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 8),
                            child: Text(productItem.title,style: detailTextHeading,),
                          ),
                        ],
                      ),
                    );
                  },),
              ),
              SizedBox(height: size.height * 0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          BottomGridContainer(
                            title: 'Thanks for visiting',
                            subTitle: "Leave  feedBack",
                            color:Colors.blue.withOpacity(0.9),
                            image: "assets/icons/message.png",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width * 0.03,),
                    Expanded(
                      child: Column(
                        children:  [
                          BottomGridContainer(
                            title: 'Invite Friends',
                            subTitle: "Refer a none friend and\n earn 100 kepi coins",
                            color:darkPurple.withOpacity(0.7),
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



  Widget buildSheet_2()=> makeDismissible(

      child:DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.4,
        maxChildSize: 1,
        builder: (BuildContext context, controller) => Container(
          color: Colors.white,
          child: ListView(
            controller: controller,
            children: [
              Container(
              color: Color(0xff737373),
          // height: 180,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              // borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40)),
            ),
            // child: _buildBottomNavigationMenu(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Order Type",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontFamily: "Avenger"),),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Image.asset("assets/icons/shopping-bag.png",width: MediaQuery.of(context).size.width *0.11 ,),
                    title: Text("Pick UP",style: modelHeading),
                    subtitle: Text("Well prepare and pack your ",style: modelSubHeading,),
                    // onTap: ()=> _selectItem('Cooling', 1),
                    trailing: _currentIndex == 1 ? Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue
                      ),
                      child: const Center(
                        child: Icon(Icons.done,color: Colors.white,size: 15,),
                      ),
                    ) : Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/shoe-shop.png",width: MediaQuery.of(context).size.width *0.11 ,),
                    title: const Text("Dine in",style: modelHeading),
                    subtitle: Text("Well prepare and pack your ",style: modelSubHeading),
                    onTap: ()=> _selectItem('People', 2),
                    trailing: _currentIndex == 2 ? Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue
                      ),
                      child: const Center(
                        child: Icon(Icons.done,color: Colors.white,size: 15,),
                      ),
                    ) : Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey
                      ),
                    ),

                  ),
                  ListTile(
                    leading: Image.asset("assets/icons/delivery-man.png",width: MediaQuery.of(context).size.width *0.12 ,),
                    title: const Text("Stats",style: modelHeading,),
                    subtitle: const Text("Well prepare and pack your ",style: modelSubHeading),
                    onTap: ()=> _selectItem('Stats', 3),
                    trailing: _currentIndex == 3 ? Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue
                      ),
                      child: const Center(
                        child: Icon(Icons.done,color: Colors.white,size: 15,),
                      ),
                    ) : Container(
                      width: 20, height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
            ],
          ),
        ),
      ));
  _selectItem(String name, int index){
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
      _currentIndex = index;
    });

  }
  Widget makeDismissible({required Widget child}){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        return Navigator.of(context).pop();

      },
      child: GestureDetector(onTap: (){},child: child,),
    );
  }
}

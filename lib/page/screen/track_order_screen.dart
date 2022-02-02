import 'package:flutter/material.dart';
import 'package:sushi/page/screen/drawer_header.dart';
import 'package:sushi/style/constant.dart';

class TrackYourOrderScreen extends StatelessWidget {
  const TrackYourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("Track your Order",style: kAppBarTitle,),
      ),
      drawer:const Drawer(
        child: MyDrawerList(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF6B9328)
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 25,),
                    const Text("Track Order", style: TextStyle(fontSize: 23, color: Colors.white),),
                    const SizedBox(height: 25,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          deliveryTimeWidget(title: "30 Mins",subTitle: 'Delivery Boy',img: "assets/icons/ic_watch.png",),
                          deliveryTimeWidget(title: "Gaur City 2",subTitle: 'Gaur City 2',img: "assets/icons/ic_location.png",),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Divider(height: 2,color: Colors.white,thickness: 2,),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/icons/profile_img.png"))
                            ),
                          ),
                          const SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("John Doe",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(height: 4,),
                              Text("Delivery Boy", style: TextStyle(fontSize: 14, color: Colors.white),),
                            ],
                          ),
                          const Spacer(),
                          socialChartIconWidget(img: 'assets/icons/ic_chat.png'),
                          const SizedBox(width: 6,),
                          socialChartIconWidget(img: 'assets/icons/ic_phone.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Container socialChartIconWidget({required String img}){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFF5C821D)
      ),
      child: Image.asset(img,scale: 1.2,),
    );
  }


  Container deliveryTimeWidget({required String title,required String subTitle,required String img,}){
    return   Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Image.asset(img,scale: 1.2,color: Colors.white,),
              ),
              const SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(title,style: const TextStyle(fontSize: 18, color: Colors.white),),
                  const SizedBox(height: 4,),
                  Text(subTitle, style: const TextStyle(fontSize: 14, color: Colors.white54),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

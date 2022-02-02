import 'package:flutter/material.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/model/pageViewImage_model.dart';
import 'package:sushi/style/theme.dart';
import 'Login/Login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (int value){
              setState(() {
                currentIndex = value;
              });
            },
            controller: _pageController,
            itemCount: pageViewImage.length,
            itemBuilder: (context, index){
              PageViewImage pageViewImageItem = pageViewImage[currentIndex];
              return Container(
                  width: size.width,
                padding: const EdgeInsets.fromLTRB(0, 35, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(pageViewImageItem.logoImg,width: size.width * 0.57,),
                    const SizedBox(height: 20,),
                    Container(
                      width: size.width * 0.65,
                      child: Image.asset(pageViewImageItem.img,fit: BoxFit.cover,),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: size.width,
              height: size.height * 0.23,
              color: Colors.white,
              padding: EdgeInsets.only(left: 14,top: 30,right: 14,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${pageViewImage[currentIndex].title}",style: const TextStyle(fontFamily:"Avenger",fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  Text("${pageViewImage[currentIndex].description}",style: const TextStyle(fontFamily:"Avenger",fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      GestureDetector(
                        onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginInPage()));
                        },
                          child: const Text("Skip",style: kTextTitle)
                      ),
                      Row(
                        children: List.generate(pageViewImage.length, (index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                currentIndex  = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 9),
                              width:16,
                              height: 16 ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color:currentIndex == index?darkBlue:Colors.grey,
                              ),

                            ),
                          );
                        }),
                      ),
                      InkWell(
                          onTap:(){
                            // if(currentIndex == pageViewImage.length-1){
                            if(currentIndex+1 == pageViewImage.length){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginInPage()));
                            }
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 400),
                                   curve: Curves.easeIn);
                          },
                          child: Text("Next",style: kTextTitle)
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

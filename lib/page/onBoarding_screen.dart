import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/model/pageViewImage_model.dart';
import 'package:sushi/style/theme.dart';
import 'Login/Login_page.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  int currentIndex = 0;
  late  PageController _pageController = PageController();

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }



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
            child:Container(
              width: size.width,
              height: size.height * 0.23,
              color:Colors.white,
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
                          onTap:() async {
                          await _storeOnboardInfo();
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
                          onTap:() async {
                            // if(currentIndex == pageViewImage.length-1){
                            if(currentIndex+1 == pageViewImage.length){
                              await _storeOnboardInfo();
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

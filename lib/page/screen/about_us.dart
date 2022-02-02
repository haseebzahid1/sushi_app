import 'package:flutter/material.dart';
import 'package:sushi/page/screen/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/widget/social_icon.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        title: const Text("About Us",style: kAppBarTitle,),
        // backgroundColor: Colors.lightBlue,
        // elevation: 0,
      ),
      drawer:const Drawer(
        // backgroundColor: Colors.transparent,
        child: MyDrawerList(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.41,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/ab_img.png"),
                  fit: BoxFit.cover,
                )
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -35,
                    right: 20,
                    child: Container(
                      child: Image.asset("assets/icons/ic_location2.png"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.04,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   const  Text("Sumo Sushi & Bento Uae",
                     style: TextStyle(
                       fontFamily: 'Avenir',
                       fontSize: 20,
                       color: Colors.black,
                       fontWeight: FontWeight.w600,
                     ),),
                  SizedBox(height: size.height * 0.02,),
                  Row(
                    children: [
                      Image.asset("assets/icons/ic_earth.png"),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child:  Text("www.sumosushibento.com",
                          style: description.copyWith(color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02,),
                  const Text("BRIGING HAPPY TO JAPANESE DINING",
                      style: TextStyle(fontFamily: 'Avenir', fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10,),
                  const Text("Good People, Good Food, and Good Fun!",
                    style: description,
                  ),
                   const Text("Sumo Sushi & Bento has been serving the best Sushi throughout the GCC for more than 20 years, providing a unique family-friendly, authentically fun Japanese restaurant. Now offering franchise opportunities globally, we continue to expand and offer this delicious experience to more Sumo Super Fans everywhere.\n\n"
                  "Sumo Chefs serve up a wide variety to please any palate. From the popular bento boxes, noodle dishes and traditional sushi to the ever famous and custom created Sumo Sandwiches, Poke Bowl and Salmon Lovers bento. Our Sushi menu offers a wide range of healthy options and quality food at affordable prices.\n\n"
                  "Come enjoy the best sushi in Dubai and beyond! Seven days a week you can dine-in lunch and dinner, takeaway or sushi delivery at your door!",
                  style: TextStyle(fontSize: 14, fontFamily: 'Avenir', color: Colors.grey,)
              ),
                  SizedBox(height: size.height * 0.04,),
                  socialIconRow(title: 'FaceBook', img: 'assets/icons/ic_fb.png'),
                  const SizedBox(height: 10,),
                  socialIconRow(title: 'FaceBook', img: 'assets/icons/ic_insta.png'),
                  const SizedBox(height: 10,),
                  socialIconRow(title: 'FaceBook', img: 'assets/icons/ic_twitter.png'),
                  const SizedBox(height: 20),
                  const Text("ABOUT THE APP",
                    style: aboutUsTitle,
                  ),
                  const SizedBox(height: 8,),
                  textDescription(),
                  const SizedBox(height: 20,),
                  const Text("LOYALTY REWARDS",
                    style: aboutUsTitle,
                  ),
                  const SizedBox(height: 8,),
                  textDescription(),
                  const SizedBox(height: 20,),
                  const Text("GIVE FEEDBACK", style: aboutUsTitle,
                  ),
                  const SizedBox(height: 8,),
                  textDescription(),
                  SizedBox(height: size.height * 0.04,),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
  Text textDescription(){
    return const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an"
        " unknown printer took a galley of type and scrambled it to make a type specimen book. "
        "It has survived not only five centuries",style: description,);
  }
  Row socialIconRow({required String img, required String title}){
    return  Row(
      children: [
        Image.asset(img),
        Container(
          padding: EdgeInsets.only(left: 12),
          child:  Text(title,
              style: description.copyWith(color: Colors.black)
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sushi/page/DetailPage/detail_page.dart';
import 'package:sushi/page/Login/Login_page.dart';
import 'package:sushi/page/onBoarding_screen.dart';
import 'package:sushi/page/screen/image_picker.dart';
import 'package:sushi/page/screen/sliver_screen.dart';


int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sumo Sushi',
      theme: ThemeData(
        fontFamily: "Avenir",
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        textTheme: const TextTheme(
            button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        iconTheme: const IconThemeData(color: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            primary: Colors.lightBlue,
          ),
        ),
      ),
      // home: isviewed != 0 ? OnBoardingScreen() : SliversDemo(),
      // home: isviewed != 0 ? OnBoardingScreen() : LoginInPage(),
      // home: SliversDemo(),
      home: DetailPage(),
    );
  }
}
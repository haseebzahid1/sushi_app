import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sushi/page/Login/Login_page.dart';
import 'package:sushi/page/categories/categoryScreen.dart';
import 'package:sushi/page/onBoarding_screen.dart';
import 'map_screen.dart';

bool? isviewed2;
int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  // isviewed2 = prefs.getBool('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MapPage(),
      // home: isviewed != 0 ? OnBoardingScreen() : MapPage(),
      // home: isviewed2 != false ? OnBoardingScreen() : LoginInPage(),
      // home: SliversDemo(),/
      // home: MapPage(),
    );
  }
}
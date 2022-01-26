import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sushi/page/signIn_Page/form/form_page.dart';
import 'package:sushi/page/splashscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        textTheme: TextTheme(
            button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            primary: Colors.lightBlue,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
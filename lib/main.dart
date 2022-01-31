import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sushi/page/DetailPage/detail_page.dart';
import 'package:sushi/page/categories/categories.dart';
import 'package:sushi/page/categories/categories_layout/categories_listview.dart';
import 'package:sushi/page/categories/categories_layout/layout_TopButtonRow.dart';
import 'package:sushi/page/mainSplashScreen.dart';
import 'package:sushi/page/order_detail/order_detail.dart';

void main() {
  runApp(const MyApp());
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
        // scaffoldBackgroundColor: Colors.white,
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
      home:  DetailPage(),
      // home:  CategoriesListView(),
      // home:  MainSplashScreen(),
    );
  }
}
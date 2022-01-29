import 'package:flutter/material.dart';
import 'DetailPage/detail_page.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailPage()));
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        child: Image.asset("assets/images/logob.png",fit: BoxFit.cover,)
      ),
    );
  }
}


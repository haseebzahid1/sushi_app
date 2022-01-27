import 'package:flutter/material.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.13,
      width: size.width,
      color: Colors.pink,
      padding: EdgeInsets.only(left: 10,top: 30,right: 10,bottom: 20),
      child: Stack(
        children: [
          Image.asset("assets/icons/arrowCircle.png"),
        ],
      ),
    );
  }
}

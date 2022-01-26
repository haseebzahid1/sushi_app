import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final String image;
  void Function()? onTap;
  final Color? bgColor;
  final Color? color;
  EdgeInsetsGeometry? padding;
  SocialIcon({Key? key, required this.image,this.onTap, this.color,this.bgColor,this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return   InkWell(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset(image,color: color,fit: BoxFit.fill,width: 60,height: 60,),
      ),
    );
  }
}

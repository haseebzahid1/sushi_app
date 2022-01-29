import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String textButton;
  void Function()? onTap;
  final double? size;
  final double width;
  final Color color;
  final Color bgColor;
  EdgeInsetsGeometry? padding;

  CustomButton({Key? key,
    required this.textButton,
    this.onTap, this.size,
    required this.width,
    required this.color,
    required this.bgColor,
    this.padding,
  }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap:widget.onTap,
      child: Container(
        padding:widget.padding??EdgeInsets.symmetric(vertical: 11),
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: Text(widget.textButton,style: TextStyle(fontSize:widget.size ?? 20,fontWeight: FontWeight.bold,color: widget.color,fontFamily: "Avenger"))),
      ),
    );
  }
}

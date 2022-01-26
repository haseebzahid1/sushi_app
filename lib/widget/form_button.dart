import 'package:flutter/material.dart';
import 'package:sushi/style/theme.dart';


class FormButton extends StatefulWidget {
  final String textButton;
  void Function()? onTap;
  final double? size;
  final double width;
  final Color color;
  final Color bgcolor;
  EdgeInsetsGeometry? padding;

  FormButton({Key? key,
    required this.textButton,
    this.onTap, this.size,
    required this.width,
    required this.color,
    required this.bgcolor,
    this.padding,
  }) : super(key: key);

  @override
  _FormButtonState createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {

    return  InkWell(
      onTap:widget.onTap,
      child: Container(
        padding:widget.padding??EdgeInsets.symmetric(vertical: 11),
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 5,
              offset: Offset(0,-0.2),
              color: bgButtonBlue.withOpacity(0.2),
            ),
          ],
          color: widget.bgcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(widget.textButton,style: TextStyle(fontSize:widget.size ?? 20,fontWeight: FontWeight.w600,color: widget.color,fontFamily: "Poppins"))),
      ),
    );
  }
}

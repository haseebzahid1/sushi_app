import 'package:flutter/material.dart';
import 'package:sushi/style/theme.dart';


class FormButton extends StatefulWidget {
  final String textButton;
  void Function()? onTap;
  final double? size;
  final double width;
  final double? height;
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
    this.height,
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
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(0,-0.2),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
          color: widget.bgcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(child: Text(widget.textButton,style: Theme.of(context).textTheme.button,)),
      ),
    );
  }
}

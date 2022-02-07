import 'package:flutter/material.dart';
import 'package:sushi/style/theme.dart';


class InputFieldWidget extends StatefulWidget {
  String? initialValue;
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  int? maxLines;
  bool? isPassword;
  TextInputType? textInputType;
  void Function(String)? onChanged;
  void Function(String?)? onSaved;
  String? Function(String?)? validate;
  TextEditingController? controller;
  Function()? onTab;
  TextInputType? keyboardType;
  InputFieldWidget({Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.onChanged,
    this.validate,
    this.prefixIcon,
    this.maxLines,
    this.isPassword,
    this.textInputType,
    this.controller,
    this.onTab,
    this.keyboardType,
  }) : super(key: key);

  @override
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {


final double size = 1.3;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTab,
      controller:widget.controller,
      obscureText: widget.isPassword ?? true,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      initialValue:widget.initialValue,
      decoration:  InputDecoration(
        hoverColor: Colors.red,
        contentPadding: EdgeInsets.symmetric(vertical: 17),
        hintText:widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.white,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: Colors.black12,width: size),
        //   gapPadding: 10,
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black12,width: size),
          gapPadding: 10,
        ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black12,width: size),
            gapPadding: 10,
      )
        // border:outlineInputBorder(),
      ),
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validate,
      maxLines: widget.maxLines ?? 1,
    );
  }

  OutlineInputBorder outlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:BorderSide(color:Colors.red,width: 2),
      gapPadding: 10,
    );

  }

}

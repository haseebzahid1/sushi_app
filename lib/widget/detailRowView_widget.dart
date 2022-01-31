import 'package:flutter/material.dart';

class DetailRowView extends StatelessWidget {
  final String title;
  final String subTitle;
  const DetailRowView({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(title,style: TextStyle(fontSize: 18,fontFamily: "Avenger",fontWeight: FontWeight.bold)),
          Spacer(),
          Row(
            children: [
              Text(subTitle,style: TextStyle(fontSize: 16,fontFamily: "Avenger",fontWeight: FontWeight.bold,color: Colors.grey),),
            ],
          ),
        ],
      ),
    );
  }
}

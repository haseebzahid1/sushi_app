import 'package:flutter/material.dart';
import 'package:sushi/style/constant.dart';

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
          Text(title,style: boldblackText),
          Spacer(),
          Row(
            children: [
              Text(subTitle,style: viewallText,),
            ],
          ),
        ],
      ),
    );
  }
}

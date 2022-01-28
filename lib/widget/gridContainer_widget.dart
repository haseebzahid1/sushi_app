import 'package:flutter/material.dart';
import 'package:sushi/style/constant.dart';

class GridContainer extends StatelessWidget {
   final String image;
   final String title;
   final String subTitle;
   final Color color;
  const GridContainer({Key? key,
    required this.color,
    required this.image,
    required this.title,
    required this.subTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.22,
      decoration: BoxDecoration(
      color: color,
        borderRadius: BorderRadius.circular(10)
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              bottom: -10,
              child: Container(
                width: 80,
                height: 80,
                child: Image.asset(image,color: Colors.white.withOpacity(0.3)),
              ),
            ),
            // Container(
            //   color:color,
            // ),
            Positioned(
              top: 38,
                child: Column(
                  children: [
                    Image.asset(image,width: 50,height: 50,),
                    Text(title,style: detailPositionHeading.copyWith(fontSize: 21),textAlign: TextAlign.center,),
                    Text(subTitle,style: detailPositionSubHeading.copyWith(fontSize: 18),textAlign: TextAlign.center,),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
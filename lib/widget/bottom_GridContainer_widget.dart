import 'package:flutter/material.dart';
import 'package:sushi/style/constant.dart';

class BottomGridContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final Color color;
  const BottomGridContainer({Key? key,
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
              right: 10,
              bottom: 4,
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
                top: 30,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 50,
                       height: 50,
                       decoration: const BoxDecoration(
                         color: Colors.white,
                         shape: BoxShape.circle,
                       ),
                        child: Image.asset(image,fit: BoxFit.cover,)
                    ),
                    SizedBox(height: 8),
                    Text(title,style: detailPositionHeading.copyWith(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    Text(subTitle,style: detailPositionSubHeading.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

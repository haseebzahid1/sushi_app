import 'package:flutter/material.dart';
import 'package:sushi/widget/order&visting_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: size.width,
              color: Colors.red,
              child: Image.asset("assets/icons/main.png",fit: BoxFit.fitWidth,)
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // SizedBox(height: size.height * 0.02,),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            GridContainer(),
                          ],
                        ),
                    ),
                    SizedBox(width: size.width * 0.02,),
                    Expanded(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey,
                              height: size.height * 0.10,
                            )
                          ],
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

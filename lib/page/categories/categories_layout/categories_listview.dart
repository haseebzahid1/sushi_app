import 'package:flutter/material.dart';
import 'package:sushi/page/DetailPage/drawer_header.dart';
import 'package:sushi/style/constant.dart';

import 'categories_girdview.dart';
import 'layout_TopButtonRow.dart';

class CategoriesListView extends StatelessWidget {

  const CategoriesListView({Key? key,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.9)),
        actions:  [
          GestureDetector(
            onTap: (){
              print("Categories");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("33",style: categoriesCoinText),
                SizedBox(width: size.width * 0.01,),
                Container(
                  width: size.width * 0.06,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/coin.png",),
                    radius: 50,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      drawer:const Drawer(
        // backgroundColor: Colors.transparent,
        child: MyDrawerList(),
      ),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02,),
          LayoutTopButtonRow(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              itemBuilder: (context, index){
              return Container(
                width: size.width,
                margin: EdgeInsets.only(top: 10),
                // color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: size.width * 0.34,
                          height: size.height * 0.20,
                          child: Image.asset("assets/icons/image.png",fit: BoxFit.cover,),
                        ),
                        SizedBox(width: size.width * 0.02,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Wagyu Steak Roll",style: categoriesTitle.copyWith(fontSize: 21)),
                                SizedBox(height: size.height * 0.01,),
                                const Text("Order at least 3-4 hours in advance",style: categoriesListSubTitle,),
                                SizedBox(height: size.height * 0.01,),
                                Text("249.00 DH",style: categoriesTitle.copyWith(fontSize: 19)),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}

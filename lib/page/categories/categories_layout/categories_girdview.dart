import 'package:flutter/material.dart';
import 'package:sushi/model/categories_model.dart';
import 'package:sushi/page/DetailPage/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'categories_listview.dart';
import 'categories_selected.dart';
import 'layout_TopButtonRow.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({Key? key}) : super(key: key);

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
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              itemCount: categories.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing:20,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index){
                Categories categoriesItem= categories[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CategoriesDetailView(
                      detailViewCategories: categoriesItem,
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            spreadRadius: 2,
                            offset: Offset(-0.9,0),
                            color: Colors.grey.withOpacity(0.5),)
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),

                            ),

                            width: size.width,
                            child: Image.asset(categoriesItem.img,fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding:   EdgeInsets.only(left: 8,right: 2,top: 7,bottom: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Wagyu Steak Roll",style: categoriesTitle,),
                              SizedBox(height: 2,),
                              Text("249.00 DH",style: detailZeroText.copyWith(fontSize: 16,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

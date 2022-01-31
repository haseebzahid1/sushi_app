import 'package:flutter/material.dart';
import 'package:sushi/model/categories_model.dart';
import 'package:sushi/page/DetailPage/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'categories_selected.dart';
import 'layout_TopButtonRow.dart';

class CategoriesListView extends StatelessWidget {
   CategoriesListView({Key? key,  }) : super(key: key);
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
              itemCount: categories.length,
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              itemBuilder: (context, index){
                Categories categoriesListItem = categories[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetailView(
                      detailViewCategories:categoriesListItem
                  )));
                },
                child: Container(
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
                            child: Image.asset(categoriesListItem.img,fit: BoxFit.cover,),
                          ),
                          SizedBox(width: size.width * 0.02,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(categoriesListItem.title,style: categoriesTitle.copyWith(fontSize: 21)),
                                  SizedBox(height: size.height * 0.01,),
                                   Text(categoriesListItem.subTitle,style: categoriesListSubTitle,),
                                  SizedBox(height: size.height * 0.01,),
                                  Text("${categoriesListItem.total} DH",style: categoriesTitle.copyWith(fontSize: 19)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },),
          )
        ],
      ),
    );
  }
}

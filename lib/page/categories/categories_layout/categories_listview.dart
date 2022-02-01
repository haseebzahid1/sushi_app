import 'package:flutter/material.dart';
import 'package:sushi/model/categories_model.dart';
import 'package:sushi/page/DetailPage/drawer_header.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'categories_girdview.dart';
import 'categories_selected.dart';
import 'layout_TopButtonRow.dart';

class CategoriesListView extends StatefulWidget {
   CategoriesListView({Key? key,  }) : super(key: key);

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  bool grid = true;
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
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Change Layout",
                  style: boldblackText,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          grid = false;
                        });
                        print("1");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/list.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                          color: grid ? Colors.grey : blueColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          grid = true;
                        });
                        print("2");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/grid.png",
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                          color: grid ? blueColor : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          grid ?
          Expanded(child: CategoriesGridView())
              : Expanded(child: ListView.builder(
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
                                    Text(categoriesListItem.title,style: categoriesTitle.copyWith(fontSize: 19)),
                                    SizedBox(height: size.height * 0.01,),
                                    Text(categoriesListItem.subTitle,style: categoriesListSubTitle,),
                                    SizedBox(height: size.height * 0.01,),
                                    Text("${categoriesListItem.total} DH",style: detailZeroText.copyWith(fontSize: 16,fontWeight: FontWeight.bold)),
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

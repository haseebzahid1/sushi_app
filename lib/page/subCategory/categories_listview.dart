import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/model/categoryItem.dart';
import 'package:sushi/page/screen/drawer_header.dart';
import 'package:sushi/page/subCategory/provider.dart';
import 'package:sushi/style/constant.dart';
import 'package:sushi/style/theme.dart';
import 'categories_girdview.dart';
import 'categories_selected.dart';
class SubCategory extends StatelessWidget {
  int? id;
   SubCategory({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>(
      create: (context) => ListProvider(),
      child:SubCategoryWidget(id:id),
    );
  }
}
class SubCategoryWidget extends StatefulWidget {
  int? id;
  SubCategoryWidget({Key? key,  this.id}) : super(key: key);

  @override
  State<SubCategoryWidget> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<SubCategoryWidget> {
  bool currentBool = true;
  void initState(){
    final provider = Provider.of<ListProvider>(context,listen: false);
    provider.fetchCategory(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ListProvider>(context);
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
                Text("${provider.itemsLength?? ""}",style: categoriesCoinText),
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
      body:provider.isServiceCalling? Column(
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
                          currentBool = false;
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
                          color: currentBool ? Colors.grey : blueColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentBool = true;
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
                          color: currentBool ? blueColor : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          currentBool ?
          Expanded(child: CategoriesGridView(
            data:provider.categoryList
          ))
              : Expanded(child: ListView.builder(
            itemCount: provider.categoryList.length,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            itemBuilder: (context, index){
              CategoryItem dataProduct = provider.categoryList[index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetailView(
                      data:dataProduct
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
                            child: Image.network(dataProduct.image!,fit: BoxFit.cover,),
                          ),
                          SizedBox(width: size.width * 0.02,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${dataProduct.title}",style: categoriesTitle.copyWith(fontSize: 19)),
                                  SizedBox(height: size.height * 0.01,),
                                  Text(dataProduct.title!,style: categoriesListSubTitle,),
                                  SizedBox(height: size.height * 0.01,),
                                  Text("${dataProduct.price} DH",style: detailZeroText.copyWith(fontSize: 17,fontWeight: FontWeight.bold)),
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
            },)
          )
        ],
      ):Center(child: CircularProgressIndicator()),
    );
  }
}

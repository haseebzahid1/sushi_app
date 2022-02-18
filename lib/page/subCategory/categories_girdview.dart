import 'package:flutter/material.dart';
import 'package:sushi/model/categoryItem.dart';
import 'package:sushi/style/constant.dart';

import 'categories_selected.dart';




class CategoriesGridView extends StatelessWidget {
  List<CategoryItem> data;
  CategoriesGridView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: GridView.builder(
              primary: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              itemCount: data.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing:20,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index){
                CategoryItem  dataProduct  = data[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesDetailView(
                        data:dataProduct,
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
                            child: Image.network("${dataProduct.image}",fit: BoxFit.cover,),
                          ),
                        ),
                        Padding(
                          padding:   EdgeInsets.only(left: 8,right: 2,top: 7,bottom: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dataProduct.title!,style: categoriesTitle,),
                              SizedBox(height: 2,),
                              Text(dataProduct.price!,style: detailZeroText.copyWith(fontSize: 11,fontWeight: FontWeight.bold)),
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

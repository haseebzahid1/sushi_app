import 'package:flutter/material.dart';
import 'categories_girdview.dart';
import 'categories_listview.dart';

class LayoutTopButtonRow extends StatelessWidget {
  const LayoutTopButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("Change Layout",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Avenger",fontSize: 21),),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesListView()));

                  },
                  child: Icon(Icons.filter_1)
              ),
              SizedBox(width: size.width * 0.01,),
              GestureDetector(
                  onTap: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesGridView()));
                  },
                  child: Icon(Icons.filter_2)
              ),
            ],
          ),
        ],
      ),
    );
  }
}

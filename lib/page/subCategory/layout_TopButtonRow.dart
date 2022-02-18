import 'package:flutter/material.dart';
import 'package:sushi/model/topBottomRow_model.dart';
import 'categories_girdview.dart';


class LayoutTopButtonRow extends StatefulWidget {
  const LayoutTopButtonRow({Key? key}) : super(key: key);


  @override
  State<LayoutTopButtonRow> createState() => _LayoutTopButtonRowState();
}
class _LayoutTopButtonRowState extends State<LayoutTopButtonRow> {
  @override
int isCurrentIndex= 0;


  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text("Change Layout",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "Avenger",fontSize: 21),),
          Spacer(),
          Row(
            children: List.generate(
                topBottomRow.length, (index){
              TopBottomRow topBottomRowItem = topBottomRow[index];
              return GestureDetector(
                onTap: (){
                  setState(() {
                    isCurrentIndex = index;
                  });
                  if(isCurrentIndex == 0){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesGridView()));
                  }
                  else if(isCurrentIndex == 1){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesGridView()));
                  }
                  print(isCurrentIndex);
                },
                  child:isCurrentIndex==index?Icon(topBottomRowItem.icon,color: Colors.lightBlue,):Icon(topBottomRowItem.icon)
              );
            }),
          )
        ],
      ),
    );
  }
}


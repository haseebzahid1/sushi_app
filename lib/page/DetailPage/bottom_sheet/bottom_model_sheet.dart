import 'package:flutter/material.dart';
import 'package:sushi/page/DetailPage/bottom_sheet/bottomSheetProvider.dart';
import 'package:sushi/page/map/map.dart';
import 'package:sushi/model/custom_contactModel.dart';
import 'package:sushi/page/screen/track_order_screen.dart';
import 'package:sushi/style/constant.dart';


class DetailBottomSheet extends StatefulWidget {
  List<ContactModel> orderItem;
  DetailBottomSheet({Key? key,required this.orderItem,}) : super(key: key);
  @override
  _DetailBottomSheetState createState() => _DetailBottomSheetState();
}
class _DetailBottomSheetState extends State<DetailBottomSheet> {
 int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          return Navigator.of(context).pop();
        },
        child:Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("Order Type",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontFamily: "Avenger"),),
              ),
              const SizedBox(height: 10,),
              Column(
                  children: List.generate(widget.orderItem.length, (index){
                    ContactModel  contactItem =  widget.orderItem[index];
                    return   ListTile(
                      leading: Image.asset(contactItem.img,width: MediaQuery.of(context).size.width *0.09 ,),
                      title: Text(contactItem.title,style: modelHeading),
                      subtitle: Text(contactItem.description,style: modelSubHeading,),
                      trailing: currentIndex == index
                          ? Container(
                        width: 20, height: 20,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.lightBlue
                        ),
                        child: const Center(
                          child: Icon(Icons.done,color: Colors.white,size: 15,),
                        ),
                      ) : Container(
                        width: 20, height: 20,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey
                        ),
                      ),
                      onTap: (){

                        setState(() {
                          currentIndex = index;
                        });
                        print(currentIndex);
                        if(currentIndex == 0){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapPage()));
                        }if(currentIndex == 2){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrackYourOrderScreen()));
                        }
                      },
                    );
                  })

              ),
            ],
          ),
        ),
    );

  }

}

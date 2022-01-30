import 'package:flutter/material.dart';
import 'package:sushi/map_screen.dart';
import 'package:sushi/model/custom_contactModel.dart';
import 'package:sushi/style/constant.dart';


class DetailBottomSheet extends StatefulWidget {
const  DetailBottomSheet({Key? key}) : super(key: key);

  @override
  _DetailBottomSheetState createState() => _DetailBottomSheetState();
}

class _DetailBottomSheetState extends State<DetailBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          return Navigator.of(context).pop();
        },
        child:DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.4,
          maxChildSize: 1,
          builder: (BuildContext context, controller) => Container(
            decoration: const BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Order Type",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontFamily: "Avenger"),),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    // controller: controller,
                      itemCount: contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        ContactModel contactItem = contacts[index];
                        // return item
                        return ListTile(
                          leading: Image.asset(contactItem.img,width: MediaQuery.of(context).size.width *0.11 ,),
                          title: Text(contactItem.name,style: modelHeading),
                          subtitle: Text(contactItem.title,style: modelSubHeading,),
                          trailing: contactItem.isSelected
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
                              contactItem.isSelected = !contactItem.isSelected;
                              });
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapPage()));

                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ));

  }

}

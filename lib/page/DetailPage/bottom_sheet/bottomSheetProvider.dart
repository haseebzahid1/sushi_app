import 'package:flutter/material.dart';
import 'package:sushi/model/custom_contactModel.dart';
import 'package:sushi/page/repo/MenuItemRepo.dart';


class BottomSheetProvider extends ChangeNotifier {
  List<ContactModel>  orderList = [];
  bool isServiceCalling =false;

  void fetchOrderType() async {
    print("api is calling");
    isServiceCalling =false;
    String _img = "assets/icons/shopping-bag.png";
    String _desc = "Well prepare and pack your";
    bool _selected = false;

      var data = await CategoriesRepo.fetchOrderData();
      if(data != null && data.isNotEmpty){

        for(int i=0; i<data.length; i++){
          orderList.add(
              ContactModel(
                  id : data[i].id,
                  title: data[i].title ?? "",
                  description: _desc,
                  isSelected: _selected,
                  img: _img
              )
          );
        }

        isServiceCalling = true;
        notifyListeners();
        print("$isServiceCalling isfvgbgbgb");
      }
      // print("Response is $data  null");
      // for(var itemm in data){
      //   print("${itemm.id} \n ${itemm.choices} ok");
      // }

  }

  // List<ContactModel> contacts = [
  //   ContactModel(
  //       title: "Pick Up",
  //       description:"Well prepare and pack your",
  //       isSelected: false,
  //       img: "assets/icons/shopping-bag.png"
  //   ),
  //   ContactModel(
  //       title: "Dine in",
  //       description:"Well prepare and pack your",
  //       isSelected: false,
  //       img: "assets/icons/shoe-shop.png"
  //   ),
  //   ContactModel(
  //       title: "Delivery",
  //       description:"Well prepare and pack your",
  //       isSelected: false,
  //       img: "assets/icons/delivery-man.png"
  //   ),
  //
  // ];
}

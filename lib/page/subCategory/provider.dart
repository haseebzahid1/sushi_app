import 'package:flutter/material.dart';
import 'package:sushi/model/categoryItem.dart';
import 'package:sushi/page/repo/MenuItemRepo.dart';

class ListProvider extends ChangeNotifier{
  List<CategoryItem>  categoryList = [];
  bool isServiceCalling= false;
  int? itemsLength;
  void fetchCategory(int? id) async{
    isServiceCalling= false;
    var data = await CategoriesRepo.getCategory(id);
    if(data!=null && data.isNotEmpty){
      categoryList = data;
      isServiceCalling= true;
      itemsLength = categoryList.length;
      notifyListeners();
    }
  }
}
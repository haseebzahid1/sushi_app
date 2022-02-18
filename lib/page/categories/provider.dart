import 'package:flutter/cupertino.dart';
import 'package:sushi/model/category.dart';
import 'package:sushi/page/repo/MenuItemRepo.dart';

class MenuItemProvider extends ChangeNotifier{
  bool isServiceCalling = false;
  List<CategoryMenuType> menuList = [];
  int? itemsLength;
  void fetchMenuType() async{
    isServiceCalling  = false;
    var menuType = await CategoriesRepo.getAllOrderTypes();
    if(menuType!=null && menuType.isNotEmpty){
      menuList = menuType;
      isServiceCalling = true;
      itemsLength = menuType.length;
      notifyListeners();
    }
  }
}
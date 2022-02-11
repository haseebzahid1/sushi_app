import 'package:flutter/material.dart';
import 'package:sushi/page/repo/MenuItemRepo.dart';


class MenuItemProvider extends ChangeNotifier{

  // MenuItemRepo menuItem = MenuItemRepo();
  // menuItem.getAllOrderTypes();
  MenuItemRepo dd = MenuItemRepo();

  void fetchMenuType() {
   dd.getAllOrderTypes();
  }


}
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sushi/model/bootSheet.dart';
import 'package:sushi/model/category.dart';
import 'package:sushi/model/categoryItem.dart';
import 'package:sushi/model/mapLocation.dart';

class CategoriesRepo{

  static Future<List<CategoryMenuType>> getAllOrderTypes() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url  = Uri.https(baseUrl, '/api/v1/categories', {"branch_id": "1", "menu_type_id": "1"});
    List<CategoryMenuType> menuType = [];
    var response = await client.get(url);
    try{
      if(response.statusCode == 200){
        var resData = jsonDecode(response.body);
        for(int i=0;i<resData["data"].length;i++){
          CategoryMenuType menuTypee = CategoryMenuType.fromJson(resData["data"][i]);
          menuType.add(menuTypee);
        }
        return menuType;
      }
      return menuType;
    }on SocketException catch (_) {
      print('Internet not connected');
    }  finally {
      client.close();
    }
    return menuType;
  }

  static Future<List<CategoryItem>> getCategory(int? id) async{
    var client = http.Client();
    List<CategoryItem> itemList = [];
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(baseUrl, '/api/v1/menu',
        {"menu_type_id": "1", "branch_id": "1", "category_id": "$id"});
    var response = await client.get(url);
  try{
    if(response.statusCode == 200){
      var resData = jsonDecode(response.body);
      for(int i=0; i<resData["data"].length;i++){
        CategoryItem itemData = CategoryItem.fromJson(resData["data"][i]);
        itemList.add(itemData);
      }
      return itemList;
    }return itemList;
  }on SocketException catch(_){
    print("Internent not connected");
  }finally {
    client.close();
  }
    return itemList;
  }

  static Future<List<MapLocation>> fetchMapData() async {
    var client = http.Client();
    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(baseUrl, '/api/v1/branches', {"menu_type_id": "1",});
    List<MapLocation> mapList = [];
    var response = await client.get(url);
    try{
      if(response.statusCode == 200){
        var resData = jsonDecode(response.body);

        for(int i=0;i<resData["data"].length;i++){
          MapLocation dataItem = MapLocation.fromJson(resData["data"][i]);
          mapList.add(dataItem);
        }
        return mapList;
      }
      return mapList;
    }on SocketException catch (_) {
      print('Internet not connected');
    }  finally {
      client.close();
    }
    return mapList;
  }

  // =======================================================================
  //
  // =======================================================================
  static Future<List<BottomSheet>> fetchOrderData() async{
   var client = http.Client();
   List<BottomSheet> orderList = [];
   String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
   var url = Uri.https(baseUrl, '/api/v1/menu-types');
   var response = await client.get(url);
   if(response.statusCode == 200){
     var resData = jsonDecode(response.body);
     for(int i=0;i<resData["data"].length;i++) {
       BottomSheet orderData = BottomSheet.fromJson(resData["data"][i]);
       orderList.add(orderData);
     }
     return orderList;
     // for(int i=0;i<resData["data"][i];i++){
     //   BottomSheet orderData = BottomSheet.fromJson(resData["data"][i]);
     // }
   }
   return orderList;
  }


}
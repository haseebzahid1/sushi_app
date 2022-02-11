import 'dart:convert';
import 'package:sushi/model/MenuType.dart';
import 'package:http/http.dart' as http;


class MenuItemRepo{

   Future<void>  getAllOrderTypes() async {
    print("Api Calling");
    var client = http.Client();

    String baseUrl = "phplaravel-438875-2225426.cloudwaysapps.com";
    var url = Uri.https(baseUrl, '/api/v1/menu-types', { "q" : "{http}" });
    List<MenuType> menutype = [];
    try{
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var resData = jsonDecode(response.body);

        for(int i=0;i<resData["data"].length;i++){
          menutype.add(MenuType(id: resData["data"][i]['id'] , title: resData['data'][i]['title']));
        }
        menutype.forEach((item){
          print("${item.id} ${item.title}");
        });

      }
    }
    catch (e) {
      print("Api Fail");
      print(e);
    }
  }

}
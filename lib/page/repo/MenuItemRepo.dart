import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sushi/model/mapLocation.dart';

class CategoriesRepo{

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
}
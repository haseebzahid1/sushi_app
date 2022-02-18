import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sushi/model/mapLocation.dart';
import 'package:sushi/page/repo/MenuItemRepo.dart';

class MapProvider extends ChangeNotifier{
  bool isServiceCalling= false;
  List<MapLocation> mapList = [];
  List<Marker> markerList = [];

  void getMapData() async{
    isServiceCalling = false;
    var mapData = await CategoriesRepo.fetchMapData();

    if(mapData !=null && mapData.isNotEmpty){
      mapList = mapData;
      for(int i=0; i<mapData.length;i++){
        markerList.add(
          Marker(
            markerId: MarkerId("${mapData[i].id}"),
            position: LatLng(mapData[i].latitude!,mapData[i].longitude!),
              infoWindow: InfoWindow(
                title: mapData[i].title,
                snippet: mapData[i].phone,
              ),
              icon:await BitmapDescriptor.fromAssetImage(
                  ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/marker.png')
          )
        );
        // markerList.add(
        //     Marker(
        //         markerId: MarkerId("${mapData[i].id}"),
        //         position: LatLng(mapData[i].latitude!,mapData[i].longitude!),
        //         infoWindow: InfoWindow(
        //           title: mapData[i].title,
        //           snippet: mapData[i].phone,
        //         ),
        //         icon:await BitmapDescriptor.fromAssetImage(
        //             ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/marker.png')
        //     )
        // );
      }
      isServiceCalling = true;
      notifyListeners();
    }
}

}
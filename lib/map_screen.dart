import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sushi/page/categories/categories.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(31.411930 , 73.108047), zoom: 16.151926040649414,);

  static const CameraPosition _kLake =   CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(31.411930 , 73.108047),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  Future<void> _goToTheFaisalabad() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  Set<Marker> _markers = {};

   late BitmapDescriptor mapMarker;
  @override
  void initState(){
    super.initState();
    setCustomMarker();
  }

 void  setCustomMarker() async {
    mapMarker = await  BitmapDescriptor.fromAssetImage(
    ImageConfiguration(), "assets/icons/marker.png",);
}

  void _onMapCreated(GoogleMapController controller){
    setState(() {
      _markers.add(
          Marker(
            markerId: const MarkerId('id-1'),
            position: const LatLng(31.411930 , 73.108047),
            icon: mapMarker,
            infoWindow: const InfoWindow(
              title: "title",
              snippet: 'A title place'
            ),
          )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _goToTheFaisalabad();
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: const Icon(Icons.where_to_vote),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("map"),
      ),
      body:GoogleMap(
        mapType: MapType.terrain,
        onMapCreated:_onMapCreated,
        markers:_markers,
        initialCameraPosition:_kGooglePlex,
      ),
    );
  }

}

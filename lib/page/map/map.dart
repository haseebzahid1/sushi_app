import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sushi/page/categories/categoryScreen.dart';
import 'package:sushi/page/map/map_provider.dart';



class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapProvider>(
      create:(context)=>MapProvider(),
      child:MapPageWidget(),
    );
  }
}



class MapPageWidget extends StatefulWidget {
  const MapPageWidget({Key? key}) : super(key: key);

  @override
  State<MapPageWidget> createState() => _MapPageState();
}

class _MapPageState extends State<MapPageWidget> {

  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(target: LatLng(25.6829929 , 55.7794104), zoom: 7.151926040649414,);

  static const CameraPosition _kLake =   CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(31.397841, 73.131817),
    tilt: 59.440717697143555,
    zoom: 10.151926040649414,
  );

  Future<void> _goToTheFaisalabad() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
  final Set<Marker> _markers = {};

  late BitmapDescriptor mapMarker;
  @override
  void initState(){
    super.initState();
    final _provider = Provider.of<MapProvider>(context, listen: false);
    _provider.getMapData();
    // setCustomMarker();
  }

  // void  setCustomMarker() async {
  //   mapMarker = await  BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(), "assets/icons/marker.png",);
  // }

  // void _onMapCreated(GoogleMapController controller){
  //   setState(() {
  //     _markers.add(
  //       Marker(
  //         markerId: const MarkerId('id-1'),
  //         position: const LatLng(31.411930 , 73.108047),
  //         icon: mapMarker,
  //         infoWindow: const InfoWindow(
  //             title: "title",
  //             snippet: 'A title place'
  //         ),
  //       ),
  //     );
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<MapProvider>(context);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // _goToTheFaisalabad();
          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: const Icon(Icons.where_to_vote),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text("map"),
      ),
      body:_provider.isServiceCalling?GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition:_kGooglePlex,
          markers: Set.of(_provider.markerList),
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          }
      ):const Center(child: CircularProgressIndicator(),),
    );
  }

}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tokenmap/Views/account.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, required this.title, required this.uid}) : super(key: key);
  final String title;
  String uid;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _map(context),
         //_account(),
        ],
      ),
    );
  }
  // Widget _account(){
  //   return Align(
  //       alignment: FractionalOffset(0.0,0.05),
  //       child: FloatingActionButton(
  //         child: const Icon(Icons.account_circle_outlined,color: Colors.blue,size: 30),
  //         onPressed: (){
  //           Navigator.push(context, MaterialPageRoute(
  //               builder: (context) => AccountPage(uid: '', title: '',)));
  //         },
  //       )
  //   );
  // }
  Widget _map(BuildContext context){
    Completer<GoogleMapController> _completer = Completer();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: GoogleMap(
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(target:LatLng(43.47022487538166, -79.69955740081939),zoom: 15),
        onMapCreated: (GoogleMapController controller){
          _completer.complete(controller);
        },
        markers: {
          sheridanMarker,
          parkMarker,
          mallMarker,
          userMarker
        },
      ),

    );
  }

  Marker sheridanMarker=Marker(
      markerId: MarkerId('sheridan'),
      position: LatLng(43.47022487538166, -79.69955740081939),
      infoWindow: InfoWindow(title: 'Sheridan Token'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ));

  Marker parkMarker=Marker(
      markerId: MarkerId('oakvillepark'),
      position: LatLng(43.466700120761026, -79.70580484408234),
      infoWindow: InfoWindow(title: 'Oakville Park Token'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ));

  Marker mallMarker=Marker(
      markerId: MarkerId('oakvillemall'),
      position: LatLng(43.462118193499975, -79.68683169434095),
      infoWindow: InfoWindow(title: 'Oakville Place Token'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ));

  Marker userMarker=Marker(
      markerId: MarkerId('user'),
      position: LatLng(43.4703868257327, -79.70188106764492),
      infoWindow: InfoWindow(title: 'User'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ));
}
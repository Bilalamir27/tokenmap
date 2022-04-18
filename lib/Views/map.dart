import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
         // _account(),
        ],
      ),
    );
  }
  // Widget _account(){
  //   return Align(
  //       alignment: FractionalOffset(0.0,0.05),
  //       child: IconButton(
  //         icon: Icon(Icons.account_circle_outlined,color: Colors.deepOrangeAccent,size: 30),
  //         onPressed: (){
  //           Navigator.push(context, MaterialPageRoute(
  //               builder: (context) => account(uid:"")));
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
        initialCameraPosition: CameraPosition(target:LatLng(43.661904723121374, -79.38172442298045),zoom: 10),
        onMapCreated: (GoogleMapController controller){
          // controller.setMapStyle(mapS.styleMap);
          _completer.complete(controller);
        },
      ),

    );
  }

// Widget _displayImages(){
//   FirebaseFirestore.instance.collection("userPost").doc(widget.uid).collection('posts').doc(widget.uid).get().then((value){
//     setState(() {
//       imageF = value.data()["image"] as File;
//     });
//   });
//   return Image.file(imageF);
// }

}
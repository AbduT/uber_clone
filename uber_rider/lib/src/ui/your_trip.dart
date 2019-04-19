import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';



class YourTripPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YourTripView();
  }
}

class YourTripView extends StatefulWidget {
  @override
  _YourTripViewState createState() => _YourTripViewState();
}

class _YourTripViewState extends State<YourTripView> {
  
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 16.0,
    bearing: 192.8334901395799,
    tilt: 59.440717697143555,
  );

  static final CameraPosition _iniCameraPosition = CameraPosition(
    target: LatLng(40.7128, -74.0060),
    zoom: 16.0,
    bearing: 192.8334901395799,
    tilt: 59.440717697143555,
  );
  @override
  void initState() {
    super.initState();
  }

  Future<void> _initCameraPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_iniCameraPosition));
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Your Trips"),
        
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _initCameraPosition();
                },
                onTap: (LatLng location) {
                  Navigator.pushNamed(context, "/select_issue");
                },
              ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Today at 1:05 AM", style: TextStyle(fontWeight: FontWeight.bold,)),
                    Spacer(),
                    Text("7.42USD", style: TextStyle(fontWeight: FontWeight.bold,)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Text("Infinity G Coupe"),
                    SizedBox(width: 10,),
                    Text("ABC123", style: TextStyle(fontWeight: FontWeight.bold,))
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
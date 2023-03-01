// ignore_for_file: camel_case_types, prefer_const_declarations, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class googleMap extends StatefulWidget {
  googleMap({super.key, this.lat = 0.0, this.long = 0.0});
  double lat;
  double long;

  @override
  State<googleMap> createState() =>
      googleMapState(googleMapState.la = lat, googleMapState.lo = long);
}

class googleMapState extends State<googleMap> {
  googleMapState(double d, double e);
  static double la = 0.0;
  static double lo = 0.0;
  static final LatLng _center = LatLng(la, lo);
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(la, lo),
    )
  };

  LatLng _currentMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  // var location;
  double? long;
  double? lat;
  Map<String, dynamic> location = {};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      // onTap: (val) {
      //   lat = val.latitude;
      //   location['lat'] = lat;

      //   long = val.longitude;
      //   location['long'] = long;

      //   setState(() {
      //     _markers.clear();
      //     _markers.add(Marker(
      //         markerId: MarkerId('1'),
      //         position: LatLng(lat!, long!),
      //         onTap: () {},
      //         draggable: true));
      //   });
      // },
      markers: _markers,
      onCameraMove: _onCameraMove,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: _currentMapPosition,
        zoom: 12,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
    // Container(
    //   padding: EdgeInsets.all(6),
    //   width: double.infinity,
    //   child: ElevatedButton(
    //     //  style: ButtonStyle(alignment: Alignment.),
    //     child: Text(
    //       'Save Location',
    //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //     ),
    //     onPressed: () {
    //       Navigator.pop(
    //         context,
    //         //  location
    //       );
    //     },
    //   ),
    // ),
  }
}

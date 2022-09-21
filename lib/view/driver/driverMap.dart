import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/const.dart';

import 'detilsUser.dart';

const LatLng DEST_LOCATION = LatLng(15.602175517333906, 32.58652310818434);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class DriverMapScreen extends StatefulWidget {
  @override
  _DriverMapScreenState createState() => _DriverMapScreenState();
}

Completer<GoogleMapController> _controller = Completer();
BitmapDescriptor? sourceIcon;
BitmapDescriptor? destinationIcon;
Set<Marker> _markers = Set<Marker>();

late LatLng destinationLocation;

void setInitialLocation() {
  destinationLocation = LatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude);
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  @override
  void initState() {
    super.initState();

// set up initial locations
    setInitialLocation();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: destinationLocation);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: GoogleMap(
                  myLocationEnabled: true,
                  compassEnabled: false,
                  markers: _markers,
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);

                    showPinsOnMap();
                  },
                ),
              ),
              Details("أمنية عبد الحفيظ", "الشهيد طه الماحي"),
            ],
          ),
          floatingActionButton: Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.only(right: 10, left: 280, bottom: 600),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('order driver Screen');
              },
              backgroundColor: Colors.white,
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.arrow_right_alt,
                color: Primarycolor,
              ),
            ),
          ),
        ));
  }

  void showPinsOnMap() {
    setState(() {
      _markers.add(Marker(
          // ignore: prefer_const_constructors
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          //    icon: destinationIcon!,
          icon: BitmapDescriptor.defaultMarker));
    });
  }
}

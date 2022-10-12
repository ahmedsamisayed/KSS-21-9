import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kss/model/api/appConstants.dart';
import 'package:kss/view/user/order%20information/Order%20information.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:location/location.dart' as lct;
import 'package:geolocator/geolocator.dart';
import '../../core/const.dart';
import '../../core/widgets/small_buttom.dart';
import 'package:location/location.dart';

import 'order information/OrderData.dart';

class UserMapScreen extends StatefulWidget {
  const UserMapScreen({Key? key}) : super(key: key);

  @override
  _UserMapScreenState createState() => _UserMapScreenState();
}

class _UserMapScreenState extends State<UserMapScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: const Text("تحديد موقع العميل"),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialCameraPosition,
            markers: markers,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              googleMapController = controller;
            },
          ),
          Positioned(
            bottom: 45,
            left: 20,
            right: 90,
            child: Padding(
               padding: const EdgeInsets.all(3),
               child: SmallButtom(
                 press: () async{
                   Position positionResult = await _determinePosition();

                   setState(() {

                      OrderData.position = "${positionResult.latitude} , ${positionResult.longitude}";
                      OrderData.positionDataLatitude = positionResult.latitude;
                      OrderData.positionDataLongitude = positionResult.longitude;
                   });
                   //print("${}");
                   //Navigator.of(context).pushNamed('Order Information Screen');
                   //  add code save position
                   Navigator.of(context).push( MaterialPageRoute(
                       builder: (context) => OrderInformationScreen(
                       )));

                       },

                 text: "تأكيد",
               )),
          ),
        ],
      ),
      
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
        child:FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          Position position = await _determinePosition();

          googleMapController
              .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)));


          markers.clear();

          markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(position.latitude, position.longitude)));

          setState(() {});

        },
        child:Icon(
          Icons.place,
          color: Colors.white,
          ),
      ),
      ),
      
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {

      //return Future.error('Location services are disabled');
      bool permissio  = await Geolocator.openLocationSettings();
      if (!permissio) {
        _determinePosition();
      } 

      
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      //permission = (await Permission.locationWhenInUse.request()) as LocationPermission;
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}

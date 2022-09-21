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
// class UserMapScreen extends StatefulWidget {
//   @override
//   _UserMapScreenState createState() => _UserMapScreenState();
// }

// class _UserMapScreenState extends State<UserMapScreen> {
//   LatLng currentLocation = LatLng(-2.131910, -79.940287);
//   GoogleMapController? _mapController;
//   //lct.Location? location;

//   /* getLocation() async {
//     var currentLocation = await location!.getLocation();
//     locationUpdate(currentLocation);
//   }*/

//   locationUpdate(currentLocation) {
//     if (currentLocation != null) {
//       setState(() {
//         this.currentLocation =
//             LatLng(currentLocation.latitude, currentLocation.longitude);
//         this._mapController!.animateCamera(CameraUpdate.newCameraPosition(
//               CameraPosition(target: this.currentLocation, zoom: 14),
//             ));
//         _createMarker();
//       });
//     }
//   }

//   static Position? position;
//   static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
//       target: LatLng(position!.latitude, position!.longitude),
//       tilt: 0.0,
//       zoom: 17,
//       bearing: 0.0);
//   Future<void> getMyCurrentLocation() async {
//     position = await LocationHelber.getCurrentLocation().whenComplete(() {
//       setState(() {});
//     });
//   }

//   @override
//   initState() {
//     super.initState();
//     getMyCurrentLocation();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   //changedLocation() {
//   //location!.onLocationChanged.listen((lct.LocationData cLoc) {
//   // ignore: unnecessary_null_comparison
//   // if (cLoc != null) locationUpdate(cLoc);
//   // });
//   // }

// // Pedir permiso de Ubicacion
//   /*requestPerms() async {
//     Map<Permission, PermissionStatus> statuses =
//         await [Permission.locationAlways].request();

//     var status = statuses[Permission.locationAlways];
//     if (status == PermissionStatus.denied) {
//       requestPerms();
//     } else {
//       gpsAnable();
//     }
//   }*/

// //Activar GPS
// /*gpsAnable() async {
//    location = lct.Location();
//     bool statusResult = await location!.requestService();

//     if (!statusResult) {
//       gpsAnable();
//     } else {
//       getLocation();
//     //  changedLocation();
//     }
//   }*/

// //crear Marker
//   Set<Marker> _createMarker() {
//     var marker = Set<Marker>();

//     marker.add(Marker(
//       markerId: MarkerId("MarkerCurrent"),
//       position: currentLocation,
//       icon: BitmapDescriptor.defaultMarker,
//       infoWindow: InfoWindow(
//         title: "الموقع ",
//         snippet:
//             "Lat ${currentLocation.latitude} - Lng ${currentLocation.longitude} ",
//       ),
//       draggable: true,
//       onDragEnd: onDragEnd,
//     ));

//     return marker;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: currentLocation,
//               zoom: 14.0,
//             ),
//             mapType: MapType.normal,
//             myLocationEnabled: true,
//             zoomControlsEnabled: false,
//             myLocationButtonEnabled: false,
//             markers: _createMarker(),
//             onMapCreated: _onMapCreated,
//           ),
//           Positioned(
//             bottom: 45,
//             left: 90,
//             right: 90,
//             child: Padding(
//                 padding: const EdgeInsets.all(3),
//                 child: SmallButtom(
//                   press: () {
//                     Navigator.of(context).pushNamed('Order Information Screen');
//                     //  add code save position
//                   },
//                   text: "تأكيد",
//                 )),
//           ),
//         ],
//       ),
//       floatingActionButton: Container(
//         margin: EdgeInsets.fromLTRB(0, 0, 8, 30),
//         child: FloatingActionButton(
//           onPressed: getMyCurrentLocation,
//           backgroundColor: Primarycolor,
//           child: Icon(
//             Icons.place,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   onDragEnd(LatLng position) {
//     print("nueva posicion $position");
//   }
// }

// class LocationHelber {
//   static Future<Position> getCurrentLocation() async {
//     bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!isServiceEnabled) {
//       await Geolocator.requestPermission();
//     }
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }
// }

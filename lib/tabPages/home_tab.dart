// class HomeTabPage extends StatefulWidget {
//   const HomeTabPage({Key? key}) : super(key: key);

//   @override
//   _HomeTabPageState createState() => _HomeTabPageState();
// }

// class _HomeTabPageState extends State<HomeTabPage> {
//   GoogleMapController? newGoogleMapController;
//   final Completer<GoogleMapController> _controllerGoogleMap = Completer();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(41.33836, 69.33454),
//     zoom: 14.4746,
//   );
//   Position? driverCurrentPosition;
//   var geoLocator = Geolocator();

//   LocationPermission? _locationPermission;
//   String statusText = "hozir oflayn";
//   Color statusColor = Colors.grey;
//   bool isDriverActive = false;

//   checkIfLocationPermissionAllowed() async {
//     _locationPermission = await Geolocator.requestPermission();
//     if (_locationPermission == LocationPermission.denied) {
//       _locationPermission = await Geolocator.requestPermission();
//     }
//   }

//   locateDriverPosition() async {
//     Position cPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     driverCurrentPosition = cPosition;

//     LatLng latLngPosition = LatLng(
//         driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

//     CameraPosition cameraPosition =
//         CameraPosition(target: latLngPosition, zoom: 14);

//     newGoogleMapController!
//         .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

//     String humanReadableAddress =
//         await AssistantMethods.searchAddressForGeographicCoOrdinates(
//             driverCurrentPosition!, context);
//     print("this is your address = " + humanReadableAddress);
//   }

//   @override
//   void initState() {
//     super.initState();

//     checkIfLocationPermissionAllowed();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GoogleMap(
//           zoomControlsEnabled: true,
//           zoomGesturesEnabled: true,
//           mapType: MapType.normal,
//           myLocationEnabled: true,
//           initialCameraPosition: _kGooglePlex,
//           onMapCreated: (GoogleMapController controller) {
//             _controllerGoogleMap.complete(controller);
//             newGoogleMapController = controller;

//             //black theme google map
//             blackThemeGoogleMap();
//             locateDriverPosition();
//           },
//         ),
//         // ui for online offline driver
//         statusText != "hozir onlayn"
//             ? Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: double.infinity,
//                 color: Colors.black87,
//               )
//             : Container(),
//         // button for online offline driver
//         Positioned(

// ignore_for_file: dead_code, unused_import, library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print, avoid_function_literals_in_foreach_calls, avoid_unnecessary_containers

//           top: statusText != "hozir onlayn"
//               ? MediaQuery.of(context).size.height * 0.40
//               : 25,
//           left: 0,
//           right: 0,
//            child: Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 child: stasusText != "hozir onlayn"
//                     ? Text(
//                         statusText,
//                         style: const  TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       )
//                     : Icon(),
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:mgovaward/asistans/black_theme.dart';
import 'dart:async';
import 'package:mgovaward/asistans/assistant_methods.dart';
import 'package:mgovaward/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mgovaward/main_screens.dart/newtrip_screen.dart';
import 'package:mgovaward/push_notifications/push_notification_system.dart';
import 'package:mgovaward/tabPages/menu_pop/menu.dart';
import 'package:popover/popover.dart';
import 'package:provider/provider.dart';

import '../info_handler/app_info.dart';
import '../widgets/progress_dialog.dart';
import 'menu_pop/pop.dart';

class HomeTabPage extends StatefulWidget {
  final void Function()? onTap;
  const HomeTabPage({Key? key, this.onTap}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  GoogleMapController? newGoogleMapController;
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.33854, 69.333453),
    zoom: 14.4746,
  );

  Position? driverCurrentPosition;
  var geoLocator = Geolocator();
  LocationPermission? _locationPermission;

  String statusText = "Now Offline";
  dynamic wait = "a";
  dynamic wait1 = "";
  dynamic lon = "";
  dynamic lat = "";
  Color buttonColor = Colors.grey;
  bool isDriverActive = false;
  List<LatLng> pLineCoOrdinatesList = [];
  Set<Polyline> polyLineSet = {};
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};
  String breakk = "";
  double latt = 0;
  double lonn = 0;
  List<dynamic> request_key_and_uid = [];
  String status = "";

  StreamSubscription<Position>? streamSubscriptionPosition;

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  locateDriverPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    driverCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(
        driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String humanReadableAddress =
        await AssistantMethods.searchAddressForGeographicCoOrdinates(
            driverCurrentPosition!, context);
    print("this is your address = " + humanReadableAddress);
  }

  readCurrentDriverInformation() async {
    currentFireBaseUser = fAuth.currentUser;
    PushNotificationSystem pushNotificationSystem = PushNotificationSystem();
    pushNotificationSystem.initializeCloudMessaging();
    pushNotificationSystem.generateAndGetToken();
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: "ride",
          body: 'Simple Button'),
    );
  }

  arrived() {}
  Future<void> drawPolyLineFromOriginToDestination() async {
    final xaydovchiInfo = await FirebaseDatabase.instance
        .ref()
        .child("Xaydovchilar")
        .child(fAuth.currentUser!.uid)
        .child("newRideStatus")
        .once();
    print("infoooooooooooooooooooooooooooooooo");
    print(xaydovchiInfo.snapshot.value);

    final longitude = await FirebaseDatabase.instance
        .ref()
        .child("All Ride Requests")
        .child(xaydovchiInfo!.snapshot.value as String)
        .child("longitude")
        .once();
    print("looooooooooooooooooooooooongitude");
    print(longitude.snapshot.value);

    final latitude = await FirebaseDatabase.instance
        .ref()
        .child("All Ride Requests")
        .child(xaydovchiInfo!.snapshot.value as String)
        .child("latitude")
        .once();
    print("laaaaaaaaaaaaaaaaaaaatitude");
    print(latitude.snapshot.value);

    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    driverCurrentPosition = cPosition;

    var originLatLng = LatLng(
        driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);
    var destinationLatLng = LatLng(
        latitude.snapshot.value as double, longitude.snapshot.value as double);

    showDialog(
      context: context,
      builder: (BuildContext context) => ProgressDialog(
        message: "Please wait...",
      ),
    );

    var directionDetailsInfo =
        await AssistantMethods.obtainOriginToDestinationDirectionDetails(
            originLatLng, destinationLatLng);

    Navigator.pop(context);

    print("These are points = ");
    print(directionDetailsInfo!.e_points);

    PolylinePoints pPoints = PolylinePoints();
    List<PointLatLng> decodedPolyLinePointsResultList =
        pPoints.decodePolyline(directionDetailsInfo!.e_points!);

    pLineCoOrdinatesList.clear();

    if (decodedPolyLinePointsResultList.isNotEmpty) {
      decodedPolyLinePointsResultList.forEach((PointLatLng pointLatLng) {
        pLineCoOrdinatesList
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    polyLineSet.clear();

    setState(() {
      Polyline polyline = Polyline(
        color: Colors.purpleAccent,
        polylineId: const PolylineId("PolylineID"),
        jointType: JointType.round,
        points: pLineCoOrdinatesList,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        geodesic: true,
      );

      polyLineSet.add(polyline);
    });
    LatLngBounds boundsLatLng;
    if (originLatLng.latitude > destinationLatLng.latitude &&
        originLatLng.longitude > destinationLatLng.longitude) {
      boundsLatLng =
          LatLngBounds(southwest: destinationLatLng, northeast: originLatLng);
    } else if (originLatLng.longitude > destinationLatLng.longitude) {
      boundsLatLng = LatLngBounds(
        southwest: LatLng(originLatLng.latitude, destinationLatLng.longitude),
        northeast: LatLng(destinationLatLng.latitude, originLatLng.longitude),
      );
    } else if (originLatLng.latitude > destinationLatLng.latitude) {
      boundsLatLng = LatLngBounds(
        southwest: LatLng(destinationLatLng.latitude, originLatLng.longitude),
        northeast: LatLng(originLatLng.latitude, destinationLatLng.longitude),
      );
    } else {
      boundsLatLng =
          LatLngBounds(southwest: originLatLng, northeast: destinationLatLng);
    }

    newGoogleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(boundsLatLng, 65));

    Marker originMarker = Marker(
      markerId: const MarkerId("originID"),
      infoWindow: const InfoWindow(title: "", snippet: "Origin"),
      position: originLatLng,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    );

    setState(() {
      markersSet.add(originMarker);
    });

    Circle originCircle = Circle(
      circleId: const CircleId("originID"),
      fillColor: Colors.green,
      radius: 12,
      strokeWidth: 3,
      strokeColor: Colors.white,
      center: originLatLng,
    );

    Circle destinationCircle = Circle(
      circleId: const CircleId("destinationID"),
      fillColor: Colors.red,
      radius: 12,
      strokeWidth: 3,
      strokeColor: Colors.white,
      center: destinationLatLng,
    );

    setState(() {
      circlesSet.add(originCircle);
      circlesSet.add(destinationCircle);
    });
  }

  Future<void> get_user_uid_and_request_key() async {
    final xaydovchiInfo = await FirebaseDatabase.instance
        .ref()
        .child("Xaydovchilar")
        .child(fAuth.currentUser!.uid)
        .child("newRideStatus")
        .once();
    print("infoooooooooooooooooooooooooooooooo");
    print(xaydovchiInfo.snapshot.value);

    final user_uid = await FirebaseDatabase.instance
        .ref()
        .child("All Ride Requests")
        .child(xaydovchiInfo!.snapshot.value as String)
        .child("user_id")
        .once();
    print("looooooooooooooooooooooooongitude");
    print(user_uid.snapshot.value);
    if (request_key_and_uid.length < 2) {
      request_key_and_uid.add(user_uid.snapshot.value);
    }

    print(request_key_and_uid);
  }

  Future<void> waiting_for_cancel() async {
    Future.delayed(const Duration(seconds: 5), () {
      print("waaaaaaaaaaaaiiiiiiiiiiitttinnggg");

      get_user_uid_and_request_key();

      Future.delayed(const Duration(seconds: 3), () {
        print("llllllllllllllllliiiiiiiiiisssssssssssssttt");
        print(request_key_and_uid);
        FirebaseDatabase.instance
            .ref()
            .child("users")
            .child(request_key_and_uid[0])
            .child("status")
            .once()
            .then((snap) {
          status = snap.snapshot.value as String;
          if (status == "canceled") {
            //alert dialog
            _showDialog();
            driverIsOnlineNow();
            FirebaseDatabase.instance
                .ref()
                .child("Xaydovchilar")
                .child(fAuth.currentUser!.uid)
                .child("newRideStatus")
                .set("idle");
            Complete();
          } else if (status == "completed") {
            print("cccccccccooooooooooommmmmmpleeeteedddd");
            return;
          } else {
            waiting_for_cancel();
          }
        });
      });
    });
  }

  clearing_function() {
    markersSet.clear();
    polyLineSet.clear();
    pLineCoOrdinatesList.clear();
    circlesSet.clear();
    request_key_and_uid.clear();
  }

  Complete() {
    Future.delayed(const Duration(seconds: 10), () {
      FirebaseDatabase.instance
          .ref()
          .child("Xaydovchilar")
          .child(fAuth.currentUser!.uid)
          .child("newRideStatus")
          .once()
          .then((snap) {
        wait = snap.snapshot.value;

        print("////////////////////////////////////////////");
        print(wait);
        if (wait != "idle" && wait != "a") {
          Fluttertoast.showToast(msg: "Patient found");
          triggerNotification();
          drawPolyLineFromOriginToDestination();
          waiting_for_cancel();
          driverIsOfflineNow();

          return;
        } else {
          Fluttertoast.showToast(msg: "Patient not found, please wait");

          print("seeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaarcccccchhh");
          Complete();
        }
      });
    });
  }

  Future<void> _showDialog() async {
    switch (await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey[200],
            title: const Text('ride '),
            content: const Text('ride canceled'),
            actions: [
              MaterialButton(
                onPressed: () {
                  //  drawPolyLineFromOriginToDestination();
                  Navigator.pop(context, clearing_function());
                },
                color: Colors.blue,
                child: const Text(
                  'Yes',
                ),
              ),
            ],
          );
        })) {
      case "Yes":
        _showSnackBar('Please wait', "Yes");
        break;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////
  // void clearPolyline (){
  //   setState(() {
  //     pLineCoOrdinatesList.clear();
  //   });
  // }
  void _showdialog() {
    // final Function clearPolyline;
    // new MainScreen(this.clearPolyline);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[200],
          title: const Text('Cancel !'),
          content: const Text('Do you agree ?'),
          actions: [
            MaterialButton(
              onPressed: () {
                /////////////////////////////////////////////////////////////
                // pLineCoOrdinatesList;
                setState(() {
                  pLineCoOrdinatesList.clear();
                });
                Navigator.pop(context);
              },
              color: Colors.blue,
              child: const Text(
                'Yes',
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
              child: const Text(
                "No",
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String text, String ans) {
    final SnackBar snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      backgroundColor: ans.compareTo('Yes') == 0 ? Colors.green : Colors.red,
      content: Row(
        children: [
          Icon(
            ans.compareTo('Yes') == 0 ? Icons.watch : Icons.remove,
            color: ans.compareTo('Yes') == 0 ? Colors.blue : Colors.red,
            size: 24,
            semanticLabel: text,
          ),
          Text(text)
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();

    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locateDriverPosition();
      checkIfLocationPermissionAllowed();
      readCurrentDriverInformation();
    });
  }

  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: sKey,
      drawer: const Menu(),
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              polylines: polyLineSet,
              markers: markersSet,
              circles: circlesSet,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                //black theme google map
                blackThemeGoogleMap(newGoogleMapController);

                locateDriverPosition();
              },
            ),
            ///////////////////////////////////////////////////////////////////
            Positioned(
              top: 30,
              left: 14,
              child: GestureDetector(
                onTap: () {
                  sKey.currentState!.openDrawer();
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.menu,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.15,
              builder: (context, scrollController) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.add_location_alt_outlined,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Provider.of<AppInfo>(context)
                                                      .userPickUpLocation !=
                                                  null
                                              ? (Provider.of<AppInfo>(context)
                                                          .userPickUpLocation!
                                                          .locationName!)
                                                      .substring(0, 30) +
                                                  "..."
                                              : "not getting address",
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }
                        // const Divider(
                        //   height: 1,
                        //   thickness: 1,
                        //   color: Colors.grey,
                        // );
                        if(index == 9){
                          return Card(
                            shape: Border(bottom: BorderSide(color:  Colors.blue.shade100)),
                               color: Colors.blue.shade100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              ElevatedButton(
                            onPressed: () {  },
                            child: Text("Search for patient"),
                          ),
                            ],
                          ),
                          );
                        }else if(index == 7){
                          return Card(
                               color:  Colors.blue.shade100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {  },
                                child: Text("Finish"),
                              ),
                             
                            ],
                          ),
                          );
                        }
                        else{
                          return SizedBox(height: 100,);
                        }
              
                      },
                    ),
                   
                    );
              },
            ),

            ///////////////////////////////////////////////////////////////////
            //ui for online offline driver
            statusText != "Now Online"
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    color: Colors.black87,
                  )
                : Container(),

            //button for online offline driver
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: AnimatedSize(
            //     curve: Curves.easeIn,
            //     duration: const Duration(milliseconds: 120),
            //     child: Container(
            //       height: 200,
            //       decoration: const BoxDecoration(
            //         color: Colors.black54,
            //         borderRadius: BorderRadius.only(
            //           topRight: Radius.circular(20),
            //           topLeft: Radius.circular(20),
            //         ),
            //       ),
            //       child: Padding(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            //         child: Column(
            //           children: [
            //             //from
            //             Row(
            //               children: [
            //                 const Icon(
            //                   Icons.add_location_alt_outlined,
            //                   color: Colors.grey,
            //                 ),
            //                 const SizedBox(
            //                   width: 12.0,
            //                 ),
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Text(
            //                       Provider.of<AppInfo>(context)
            //                                   .userPickUpLocation !=
            //                               null
            //                           ? (Provider.of<AppInfo>(context)
            //                                       .userPickUpLocation!
            //                                       .locationName!)
            //                                   .substring(0, 22) +
            //                               "..."
            //                           : "not getting address",
            //                       style: const TextStyle(
            //                           color: Colors.grey, fontSize: 14),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //             const Divider(
            //               height: 1,
            //               thickness: 1,
            //               color: Colors.grey,
            //             ),

            //             const SizedBox(height: 25.0),
            //             // ElevatedButton(
            //             //   onPressed: () async {
            //             //     await drawPolyLineFromOriginToDestination();
            //             //     //Complete();
            //             //   },
            //             //   style: ElevatedButton.styleFrom(
            //             //     padding: const EdgeInsets.symmetric(
            //             //       horizontal: 45,
            //             //       vertical: 20,
            //             //     ),
            //             //   ),
            //             //   child: const Text(
            //             //     "Get a Ride",
            //             //     style: TextStyle(fontSize: 20, height: 22/20,
            //             //     fontWeight: FontWeight.bold
            //             //     ),
            //             //   ),
            //             // ),
            //             ElevatedButton(onPressed: (){
            //               print(latt.runtimeType);
            //               print("tttttyyyyyyyyyyyyyyyyyyyyypr");
            //               print(latt);

            //             }, child: Text("search")),

            //             //to
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              top: statusText != "Now Online"
                  ? MediaQuery.of(context).size.height * 0.46
                  : 25,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (isDriverActive != true) //offline
                      {
                        driverIsOnlineNow();
                        Complete();
                        //updateDriversLocationAtRealTime();
                        setState(() {
                          statusText = "Now Online";
                          isDriverActive = true;
                          buttonColor = Colors.transparent;
                        });
                        //display Toast
                        Fluttertoast.showToast(msg: "you are Online Now");
                      } else //online
                      {
                        driverIsOfflineNow();

                        setState(() {
                          statusText = "Now Offline";
                          isDriverActive = false;
                          buttonColor = Colors.grey;
                        });

                        //display Toast
                        Fluttertoast.showToast(msg: "you are Offline Now");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: statusText != "Now Online"
                        ? Text(
                            statusText,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.phonelink_ring,
                            color: Colors.white,
                            size: 26,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  driverIsOnlineNow() async {
    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    driverCurrentPosition = pos;

    Geofire.initialize("activeDrivers");

    Geofire.setLocation(currentFireBaseUser!.uid,
        driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);

    DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child("Xaydovchilar")
        .child(currentFireBaseUser!.uid)
        .child("newRideStatus");

    ref.set("idle"); //searching for ride request
    ref.onValue.listen((event) {});
  }

  updateDriversLocationAtRealTime() {
    streamSubscriptionPosition =
        Geolocator.getPositionStream().listen((Position position) {
      driverCurrentPosition = position;

      if (isDriverActive == true) {
        Geofire.setLocation(currentFireBaseUser!.uid,
            driverCurrentPosition!.latitude, driverCurrentPosition!.longitude);
      }

      LatLng latLng = LatLng(
        driverCurrentPosition!.latitude,
        driverCurrentPosition!.longitude,
      );

      newGoogleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
    });
  }

  driverIsOfflineNow() {
    Geofire.removeLocation(currentFireBaseUser!.uid);

    DatabaseReference? ref = FirebaseDatabase.instance
        .ref()
        .child("drivers")
        .child(currentFireBaseUser!.uid)
        .child("newRideStatus");
    ref.onDisconnect();
    ref.remove();
    ref = null;

    //Future.delayed(const Duration(
    //milliseconds: 2000
    // ), ()
    //{
    //SystemChannels.platform.invokeMethod("SystemNavigator.pop");
    //SystemNavigator.pop();
    // });
    // }
  }
}

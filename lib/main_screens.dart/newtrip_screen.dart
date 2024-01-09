import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mgovaward/models/user_ride_request_information.dart';
import 'package:mgovaward/asistans/black_theme.dart';

class NewTripScreen extends StatefulWidget {
  UserRideRequestInformation? userRideRequestInformation;
  NewTripScreen({
    this.userRideRequestInformation,
  });

  @override
  State<NewTripScreen> createState() => _NewTripScreenState();
}

class _NewTripScreenState extends State<NewTripScreen> {
  GoogleMapController? newTripGoogleMapController;
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.33854, 69.333453),
    zoom: 14.4746,
  );
  String? buttonTitle="Arrrived";
  Color? buttonColor= Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMap.complete(controller);
              newTripGoogleMapController = controller;

              //black theme google map
              blackThemeGoogleMap(newTripGoogleMapController);
            },
          ),
          //uii
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white30,
                        blurRadius: 18,
                        spreadRadius: .5,
                        offset: Offset(0.6, 0.6))
                  ]),
              child: Column(
                children: [
                  // duration
                  Text(
                    "duration",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  // user name - icon
                  Row(
                    children: [
                      Text(
                          widget.userRideRequestInformation!.userName!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent),
                      ),
                   const    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.phone_android,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  // user Pickup address with icon
                  Row(
                    children: [
                      Image.asset(
                        "lib/images/origin.png",
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                        widget.userRideRequestInformation!.originAddress!,
                            //   widget.userRideRequestDetails!.originAddress!,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                      onPressed: () {}, style: ElevatedButton.styleFrom(primary: buttonColor, ),
                      icon: const Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 25,
                      ),
                      label: Text(
                        buttonTitle!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

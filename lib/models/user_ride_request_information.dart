import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserRideRequestInformation{
  LatLng? originLatLng;
  String? originAddress;
String? rideRequestId;
String? userName;
String? userPhone;

UserRideRequestInformation({
  this.originAddress,
  this.originLatLng,
  this.rideRequestId,
this.userName,
this.userPhone, 
});
}
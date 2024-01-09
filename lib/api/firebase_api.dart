import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  // create an instance of Firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  // Function to initialize notifications
  Future<void> initNotifications() async {
// request permission from user (will prompt user)
    await _firebaseMessaging.requestPermission();
// fetch the fcm token for this device
    final fCMToken = await _firebaseMessaging.getToken();
    print(fCMToken);
    print(
        "******************************************************************************");
    print(
        "******************************************************************************");
        print("******************************************************************************");
        print(
        "******************************************************************************");
    print(
        "******************************************************************************");
        print("******************************************************************************");
        print(
        "******************************************************************************");
    print(
        "******************************************************************************");
        print("******************************************************************************");
        print(
        "******************************************************************************");
    print(
        "******************************************************************************");
        print("******************************************************************************");
        print(
        "******************************************************************************");
    print(
        "******************************************************************************");
        print("******************************************************************************");
        
    print("blabla");
// print toke
    print("TOken$fCMToken");
    debugPrint('Token$fCMToken');
  }
}

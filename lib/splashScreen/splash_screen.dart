// ignore_for_file: unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mgovaward/authentication/login_screen.dart';
import 'package:mgovaward/authentication/sing_up_screen.dart';
import 'package:mgovaward/global/global.dart';
import 'package:mgovaward/main_screens.dart/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mgovaward/tabPages/home_tab.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(
        const Duration(
          seconds: 3,
        ), () async {
      // userni home screenga jo`natish
      if (await fAuth.currentUser != null) {
        currentFireBaseUser=fAuth.currentUser;
         Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => HomeTabPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => LoginScreen()),
        );
      }

// send user to home screen
    });
  }

  @override
  void initState() {
    //  // TODO: implement initState
    super.initState();
    startTimer();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.blue.shade200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Lottie.asset(
                  'lib/assets/dri.json',
                  fit: BoxFit.fill,
                  
                ),
              ),
              //   Image.asset("lib/images/logo1.png"),
              // const SizedBox(
              //   height: 30,
              // ),
               Text(
                ' Yordamchi  ',
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

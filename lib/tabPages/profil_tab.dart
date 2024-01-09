import 'package:flutter/material.dart';
import 'package:mgovaward/global/global.dart';
import 'package:mgovaward/splashScreen/splash_screen.dart';
class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: ElevatedButton(child: const  Text("akkauntdan chiqib ketish"),
        onPressed:(){fAuth.signOut();
         Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => const MySplashScreen()),
            );
          },
        )
      ),
    );
  }
}
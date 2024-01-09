import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/material.dart';

import '../../global/global.dart';
import '../../splashScreen/splash_screen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      RadialMenu(
        children: [
          RadialButton(
            buttonColor: Colors.grey,
            icon: const Icon(Icons.person),
            onPress: () { }
          ),
          RadialButton(
            buttonColor: Colors.purple,
            icon: const Icon(Icons.settings),
            onPress: () { }

          ),
          RadialButton(
            buttonColor: Colors.blue,
            icon: const Icon(Icons.history),
            onPress: () { },
          ),
          RadialButton(
            buttonColor: Colors.red,
            icon: const Icon(Icons.exit_to_app),
            onPress: () { fAuth.signOut();
                   Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));},
          ),
        ],
        
      ),
    ]);;
  }
}
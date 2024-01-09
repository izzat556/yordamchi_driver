import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // child: Text("Home"),
          height: 50,
          color: Colors.blue.shade300,
        ),
        Container(
          // child: Text("History"),
          height: 50,
          color: Colors.blue.shade200,
        ),
        Container(
          // child: Text("Settings"),
          height: 50,
          color: Colors.blue.shade100,
        ),
      ],
    );;
  }
}
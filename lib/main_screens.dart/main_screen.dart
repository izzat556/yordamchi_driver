// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:mgovaward/tabPages/home_tab.dart';
// import 'package:mgovaward/tabPages/ish_vaqti_tab.dart';
// import 'package:mgovaward/tabPages/profil_tab.dart';
// import 'package:mgovaward/tabPages/statistika_tab.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen>
//     with SingleTickerProviderStateMixin {
 
//   // int _currerntindex=0;
//   // final List<Widget> _pages= [
    
//   //  const HomeTabPage(),
//   //  const StatistikaTabPage(),
//   // //  const IshVaqti(),
//   //  const ProfileTabPage(),
//   // ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // body: _pages[_currerntindex],
        
//         // bottomNavigationBar: BottomNavigationBar(
//         //   items: const  [
//         //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Asosiy"),
//         //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "PROFIl"),
//         //     BottomNavigationBarItem(icon: Icon(Icons.timelapse), label: "Ish vaqti"),
//         //      BottomNavigationBarItem(icon: Icon(Icons.rate_review),label: "Statistika"),
//         //   ], 
//         // unselectedItemColor: Colors.white54,
//         // selectedItemColor: Colors.white,
//         // backgroundColor: Colors.black,
//         // type: BottomNavigationBarType.fixed,
//         // selectedLabelStyle: const  TextStyle(fontSize: 14),
//         // showUnselectedLabels:true,
//         // onTap: onItemClicked,
//         bottomNavigationBar: Container(
//           color: Colors.lightBlue.shade300,
//           child:   Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
//             child: GNav(
//               gap: 8,
//               backgroundColor: Colors.lightBlue.shade300,
//               color: Colors.white,
//               activeColor: const Color.fromARGB(255, 237, 111, 102),
//               tabBackgroundColor: Colors.lightBlue.shade200,
//               padding: const EdgeInsets.all(16),
//               selectedIndex: _currerntindex,
//               onTabChange: (index){
//                 setState(() {
//                   _currerntindex=index;
//                 });
//               },
//               tabs: const [
//                 GButton(icon: Icons.home,text: 'Home', ),
//                 GButton(icon: Icons.rate_review,text: 'Statistic',),
//                 // GButton(icon: Icons.timelapse,text: 'Work time'),
//                 GButton(icon: Icons.person,text: 'Profile',),
//               ],
//               ),
//           ),
//         ),
//         // ),
//         );
//   }
// }

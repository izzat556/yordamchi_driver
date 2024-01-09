// ignore_for_file: sort_child_properties_last

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mgovaward/global/global.dart';
import 'package:mgovaward/splashScreen/splash_screen.dart';
class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();
  List<String> carTypeList = ["xususiy", " Davlat", "avtomobil tanlang"];
  late String?  SelectedCarType = carTypeList.last;
  saveCarInfo() {
    Map driverCarInfoMap = {
      "car_Color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": carTypeList,
    };

    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("Xaydovchilar");
    driversRef
        .child(currentFireBaseUser!.uid)
        .child("moshina detallari")
        .set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Moshina detallari saqlandi.");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("lib/images/dra.jpg"),
              ),
            
               Text(
                " Car Info ",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.white,
                    fontSize: 30,height: 32/30,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20,),
              //0637
              // TextField(
              //   controller: carModelTextEditingController,
              //   keyboardType: TextInputType.text,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Moshina ismi ",
              //     hintText: "ford, damas, hyundai",
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 10,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              // TextField(
              //   controller: carNumberTextEditingController,
              //   keyboardType: TextInputType.emailAddress,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Moshina Nomeri",
              //     hintText: " 01777AAA ",
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 10,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              // TextField(
              //   controller: carColorTextEditingController,
              //   keyboardType: TextInputType.phone,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Moshina rangi",
              //     hintText: "oq",
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.grey,
              //       ),
              //     ),
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 10,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: carModelTextEditingController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Car Name',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: carNumberTextEditingController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Car Number',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                      controller: carColorTextEditingController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Car color',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                padding: const EdgeInsets.only(left: 16,right: 16,),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(18)
                ),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(15),
                  iconSize: 26,
                  focusColor: Colors.blue,
                  dropdownColor: Colors.blue.shade100,
                  hint:  
                     Text(
                      "Choose the Car",
                      style: TextStyle(
                        fontSize: 15.0,height: 17/15,
                        color: Colors.blue.shade100,
                      ),
                    ),
                  value: SelectedCarType,
                  onChanged: (newValue) {
                    setState(() {
                      SelectedCarType = newValue.toString();
                    });
                  },
                  items: carTypeList.map((car) {
                    return DropdownMenuItem(
                      child: Text(
                        car,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      value: car,
                    );
                  }).toList(),
                ),
              ),


              const SizedBox(
                height: 20,
              ),

               ElevatedButton(
                
                onPressed: () {
                
                if (carColorTextEditingController.text.isNotEmpty &&
                      carNumberTextEditingController.text.isNotEmpty &&
                      carModelTextEditingController.text.isNotEmpty &&
                      SelectedCarType != null) {
                    saveCarInfo();
                  }
                  
                },
                style: ElevatedButton.styleFrom(
               //   primary: Colors.lightGreenAccent,
                  backgroundColor: Colors.redAccent.shade200,
                  padding: const EdgeInsets.symmetric(horizontal: 55,vertical: 25),
                  disabledBackgroundColor: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      "Sign up ",
                      style: TextStyle(color: Colors.white, fontSize: 18),

                    ),
                  ),
                ),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     if (carColorTextEditingController.text.isNotEmpty &&
              //         carNumberTextEditingController.text.isNotEmpty &&
              //         carModelTextEditingController.text.isNotEmpty &&
              //         SelectedCarType != null) {
              //       saveCarInfo();
              //     }
              //     //todo
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.lightGreenAccent,
              //   ),
              //   child: const Text(
              //     "Akkaunt qo`shish",
              //     style: TextStyle(color: Colors.black54, fontSize: 18),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

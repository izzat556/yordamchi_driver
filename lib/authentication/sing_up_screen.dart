import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mgovaward/authentication/car_info_screen.dart';
import 'package:mgovaward/authentication/login_screen.dart';
import 'package:mgovaward/global/global.dart';
import 'package:mgovaward/widgets/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // textni pererabotka qilish uchun bizaga controller kere
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  // validate form -> bu metod, agar classdan tashqarida bo`lsa funksiya bo`ladi
  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: "Ism kamida 3 ta xarf bo`lishi kere");
    } else if (!emailTextEditingController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Maymunchani qoymadingku ");
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Telefon nomerini kirgizish kerak");
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(msg: "parol  6tadan ko`p bo`lishi kerak");
    } else {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Please Wait",
          );
        });
    // _ private qilib qilib qoyadi

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error:" + msg.toString());
    }))
        .user;
    if (firebaseUser != null) {
      Map driversMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child("Xaydovchilar");
      driversRef.child(firebaseUser.uid).set(driversMap);
      currentFireBaseUser = firebaseUser;
       Fluttertoast.showToast(msg: "Account Created!");
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (c) => const CarInfoScreen()));

    } 
    else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account did not create!");
    }
  }

  // trim - bermaseng password va email yacheykadegini, pustoy yacheykasiniyam hisoblidi
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("lib/images/doc.jpg",
                  height: 280,width: 280,
                  color: Colors.blue.shade200,
                  colorBlendMode: BlendMode.dstATop,
                  ),
                ),
              
              
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    " Register as a Driver ",
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.white,
                        fontSize: 26,height: 28/26,
                        fontWeight: FontWeight.bold
                    ),
                    // style: GoogleFonts.dmSerifDisplay(
                    //     color: Colors.white,
                    //     fontSize: 26,height: 28/26,
                    //     fontWeight: FontWeight.bold
                    // ),
                  ),
                ],
              ),
              // TextField(
              //   controller: nameTextEditingController,
              //   keyboardType: TextInputType.text,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "ism",
              //     hintText: "Anvarjon",
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
              const SizedBox(height: 20,),
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
                      controller: nameTextEditingController,
                      keyboardType: TextInputType.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),
              // TextField(
              //   controller: emailTextEditingController,
              //   keyboardType: TextInputType.emailAddress,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Email",
              //     hintText: "anvarjonjurakulov@gmail.com",
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
              const SizedBox(height: 10,),
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
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              // TextField(
              //   controller: phoneTextEditingController,
              //   keyboardType: TextInputType.phone,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "telefon raqami",
              //     hintText: "+998998218775",
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
              const SizedBox(height: 10,),
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
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone',
                      ),
                    ),
                  ),
                ),
              ),
              // TextField(
              //   controller: passwordTextEditingController,
              //   keyboardType: TextInputType.text,
              //   obscureText: true,
              //   style: const TextStyle(
              //     color: Colors.grey,
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Paroli:",
              //     hintText: "lorepiem",
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
              const SizedBox(height: 10,),
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
                      obscureText: true,
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                
                onPressed: () {
                  validateForm();

                  //todo
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
                      "Create account ",
                      style: TextStyle(color: Colors.white, fontSize: 18),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((c) =>  LoginScreen()),
                        ),
                      );
                    },
                    child:  const Text("Login here!",style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,height: 17/15,
                    ),),
                  ),
                  const SizedBox(width: 15,),
                  // ElevatedButton(
                  //   onPressed: (){
                  //     Navigator.push(context,MaterialPageRoute(builder: (context)=>CarInfoScreen()));
                  //   }, 
                  //   child:const Text('Car info page',style: TextStyle(
                  //     color: Colors.black,fontWeight: FontWeight.bold,
                  //     fontSize: 15,height: 17/15
                  //   ),),
                  // ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

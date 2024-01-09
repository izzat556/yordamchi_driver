import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mgovaward/authentication/sing_up_screen.dart';
import 'package:mgovaward/global/global.dart';
import 'package:mgovaward/splashScreen/splash_screen.dart';
import 'package:mgovaward/widgets/progress_dialog.dart';

import 'package:fluttertoast/fluttertoast.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailTextEditingController = TextEditingController();
//   TextEditingController passwordTextEditingController = TextEditingController();
 //  validateForm() {
//       if (!emailTextEditingController.text.contains("@")) {
//       Fluttertoast.showToast(msg: "Maymunchani qoymadingku ");
//     } else if (passwordTextEditingController.text.isEmpty) {
//       Fluttertoast.showToast(msg: "parol yozilishi kerak");
//     } else {
//     loginDriverNow();
//     }
//   }
  //  loginDriverNow() async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext c) {
  //         return ProgressDialog(
  //           message: " Bajarilvotti , iltimos ozgina kuting ",
  //         );
  //       });
   
  //   final User? firebaseUser = (await fAuth.signInWithEmailAndPassword(
  //     email: emailTextEditingController.text.trim(),
  //     password: passwordTextEditingController.text.trim(),
  //   )
  //           .catchError((msg) {
  //     Navigator.pop(context);
  //     Fluttertoast.showToast(msg: "xato:" + msg.toString());
  //   }))
  //       .user;
  //   if (firebaseUser != null) {
  //       currentFireBaseUser = firebaseUser;
  //      Fluttertoast.showToast(msg: "Muvaffaqiyatli akauntga kirdingiz");
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (c) =>const  MySplashScreen()));

  //   } 
  //   else {
  //     Navigator.pop(context);
  //     Fluttertoast.showToast(msg: "akkauntingizga kira olmadingiz/ xato akauntga kirishda yuz berdi");
  //   }
  // }
     
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Padding(0
//           padding: const EdgeInsets.al0l(20.0),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 30,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset("lib/images/103.png"),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 " Haydovchi sifatida kirish ",
//                 style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold),
//               ),
//               TextField(
//                 controller: emailTextEditingController,
//                 keyboardType: TextInputType.emailAddress,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   hintText: "anvarjonjurakulov@gmail.com",
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 10,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: passwordTextEditingController,
//                 keyboardType: TextInputType.text,
//                 obscureText: true,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//                 decoration: const InputDecoration(
//                   labelText: "Paroli:",
//                   hintText: "lorepiem",
//                   enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   hintStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 10,
//                   ),
//                   labelStyle: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   validateForm();
//                //  Navigator.push(context, MaterialPageRoute(builder: ((c) =>CarInfoScreen() ),),);
//                   //todo
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.lightGreenAccent,
//                 ),
//                 child: const Text(
//                   "Akkauntga kirish",
//                   style: TextStyle(color: Colors.black54, fontSize: 18),
//                 ),
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: ((c) => SignUpScreen()),
//                       ),
//                     );
//                   },
//                   child: const Text(" Akkkauntingiz yo`qmi ? "),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





class LoginScreen extends StatefulWidget
{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}




class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm()
  {
    if(!emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "@- enter your email please");
    }
    else if(passwordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Enter your password");
    }
    else
    {
      loginDriverNow();
    }
  }


 loginDriverNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: " Please Wait! ",
          );
        });
   
    final User? firebaseUser = (await fAuth.signInWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error:" + msg.toString());
    }))
        .user;
    if (firebaseUser != null) {
        currentFireBaseUser = firebaseUser;
       Fluttertoast.showToast(msg: "You Successfully Enter");
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const  MySplashScreen()));

    } 
    else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: " Error!!! You could not entered to account!");
    }
  }
  /*loginDriverNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: " Protsesda,iltimos ozgina kuting",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Xato: " + msg.toString());
        })
    ).user;

    if(firebaseUser != null)
    {
      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(firebaseUser.uid).once().then((driverKey)
      {
        final snap = driverKey.snapshot;
        if(currentFireBaseUser != null)
        {
          currentFireBaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Muvvaffaqiyatli login");
          
          Navigator.push(context, MaterialPageRoute(builder: (c)=>  MySplashScreen()));
        }
        else
        {
          Fluttertoast.showToast(msg: "e-mailingiz bilan oldin kirmagansiz");
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=>  MySplashScreen()));
        }
      });
    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "login qilishda xato yuz berdi");
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  'lib/images/d.png',
                  scale: 0.5,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              Text(
                "Login as a Driver",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.black,
                  
                ),
              ),

              // TextField(
              //   controller: emailTextEditingController,
              //   keyboardType: TextInputType.emailAddress,
              //   style: const TextStyle(
              //       color: Colors.grey
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Email",
              //     hintText: "Email",
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 10,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 30,
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
              const SizedBox(
                height: 10,
              ),
              // TextField(
              //   controller: passwordTextEditingController,
              //   keyboardType: TextInputType.text,
              //   obscureText: true,
              //   style: const TextStyle(
              //       color: Colors.grey
              //   ),
              //   decoration: const InputDecoration(
              //     labelText: "Paroli",
              //     hintText: "Paroli",
              //     enabledBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     focusedBorder: UnderlineInputBorder(
              //       borderSide: BorderSide(color: Colors.grey),
              //     ),
              //     hintStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 10,
              //     ),
              //     labelStyle: TextStyle(
              //       color: Colors.grey,
              //       fontSize: 14,
              //     ),
              //   ),
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

              // Container(
              //   padding: const EdgeInsets.all(25),
              //   margin: const EdgeInsets.symmetric(horizontal: 25),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.black),
              //     color: Colors.redAccent.shade200,
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child:  Center(
              //     child: GestureDetector(
              //       onTap: (){
              //         validateForm();
              //       },
              //       child: const Text(
              //         'Login',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 25,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20,height: 22/20),

                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // validateForm();
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue,
              //   ),

              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 25),
              //       child: Container(
              //         padding: EdgeInsets.all(20),
              //         decoration:
              //             BoxDecoration(borderRadius: BorderRadius.circular(15),
              //             border: Border.all(color: Colors.blue),
              //             color: Colors.blue
              //             ),
              //           child: const Text(
              //             "Login",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 25,
              //             ),
              //           ),
              //         ),
              //     ),
              //   ),

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do not have account ?",
                    style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    child: Text(
                      "Create Account Here !",
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => const SignUpScreen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


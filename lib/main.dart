
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mgovaward/info_handler/app_info.dart';
import 'package:mgovaward/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:mgovaward/api/firebase_api.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
// restart funksiyasi qowilgani sababi- live gps bilan ishlagani uchun- driverlar joyini ozgartirgani uchun 
// kereli kotta rol oynidi
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'basic notifications',
        channelDescription: 'Notification channel for basic tests',
      ),
    ],
    debug: true,
  );
await FirebaseApi().initNotifications();
  runApp(MyApp(
    child: ChangeNotifierProvider(
      create: (context)=>AppInfo(),
      child: MaterialApp(
        title: 'Haydovchi ilovasi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MySplashScreen(),
        debugShowCheckedModeBanner: false,
        // emulatori chetidagi debug digan yozuvini ochirib tashidi
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
 final Widget? child;
 const MyApp({this.child});
 static void restartApp(BuildContext )
 { BuildContext.findAncersotrStateOfType<_MyAppState>()!.restartApp();
 // ! null check 
 // live location - uchun
 // restart- applicationni polnotsenniy boshidan restart qiladi
 }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key= UniqueKey();
  void restartApp(){
    setState(() {
      key= UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      //keyedsubtree
      child: widget.child!,
      key: key,
    );
  }
}
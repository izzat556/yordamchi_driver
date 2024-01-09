// ratingni statistika qildim
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
class StatistikaTabPage extends StatefulWidget {
  const StatistikaTabPage({super.key});

  @override
  State<StatistikaTabPage> createState() => _StatistikaTabPageState();
}

class _StatistikaTabPageState extends State<StatistikaTabPage> {
  @override
  // void initState() {
  //   super.initState();
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  // }

  // triggerNotification() {
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 10, channelKey: 'basic_channel', title: 'Simple Notification', body: 'Simple Button'),);
  // }



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(child: Text('History',style: TextStyle(
        color: Colors.white,fontSize: 30,
      ),)),
    );
  }
}
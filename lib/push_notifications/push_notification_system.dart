
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mgovaward/global/global.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Future initializeCloudMessaging() async {
    //1.terminated when app completely closed , and open directly from push notification
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {
      if (remoteMessage != null) {
        print("this is rider request id  ");
        print(remoteMessage.data["rideRequestId"]);
//readUserRideRequestInformation(remoteMessage.data["rideRequestId"]);
        // display ride request information - user information who request a ride
      }
    });
//2. foreground when the app open  and it recieves a push notification
    FirebaseMessaging.onMessage.listen(((RemoteMessage? remoteMessage) {
      print("this is rider request id  ");
      print(remoteMessage!.data["rideRequestId"]);
     // readUserRideRequestInformation(remoteMessage.data["rideRequestId"]);
    }));


//3. Background- whe the app is in the background and opened directly from the  push notification
    FirebaseMessaging.onMessageOpenedApp
        .listen(((RemoteMessage? remoteMessage) {
      //readUserRideRequestInformation(remoteMessage.data["rideRequestId"]);
      // display ride request information - user information who request a ride
    }));
  }
 /* Future<Map<String, dynamic>> readRequestInformation(String userRideRequestId) async {
  try {
    // Use await to make the asynchronous call and wait for the result.
   
FirebaseDatabase.instance
        .reference()
        .child("All Ride Requests")
        .child(userRideRequestId)
        .once()== DataSnapshot; 
    // You can convert the snapshot value to a Map or any other appropriate data type.
     Map  requestData = DataSnapshot.value;

    // Handle the data or perform additional operations if needed.

    return DataSnapshot;
  } catch (error) {
    // Handle any errors that occur during the database operation.
    print("Error reading request information: $error");
    throw error; // You can re-throw the error or handle it as needed.
  }
}*/

// Future<Map<String, dynamic>> readRequestInformation(String userRideRequestId) async {
//   try {
//     // Use await to make the asynchronous call and wait for the result.
//     DataSnapshot anvarsnap = await FirebaseDatabase.instance
//         .reference()
//         .child("All Ride Requests")
//         .child(userRideRequestId)
//         .once();

//     // Access 'value' from the 'snapshot' instance.
//     Map<String, dynamic> requestData = anvarsnap.value;

//     // Handle the data or perform additional operations if needed.

//     return requestData;
//   } catch (error) {
//     // Handle any errors that occur during the database operation.
//     print("Error reading request information: $error");
//     throw error; // You can re-throw the error or handle it as needed.
//   }
// }


  // readRequestInformation(String userRideRequestId)async{
  //  FirebaseDatabase.instance
  //   .reference()
  //   .child("All Ride Requests")
  //   .once()
  //   .then((DataSnapshot snapshot)  {
  //    if (snapshot.value = null) {
  //      var origin = snapshot.value["origin"];
  //       // Делайте что-то с переменной origin
  //     } else {
  //       Fluttertoast.showToast(msg: "Данные не существуют");
  //     }
  //   })
  //   .catchError((error) {
  //     // Обработка ошибок, если запрос не удался
  //     print("Произошла ошибка: $error");
  //   });}
 /*   Future<void> readRequestInformation(String userRideRequestId) async {
  try {
    // Используйте await для выполнения асинхронного запроса к базе данных и ожидания результата.
    DataSnapshot snapshot = await FirebaseDatabase.instance
        
        .child("All Ride Requests")
        .child(userRideRequestId)
        .once();
 FirebaseDatabase.instance.reference().child("All Ride Requests").once()==  snapshot;
    // Проверьте, что значение не равно null перед попыткой доступа к нему.
    if (snapshot.value != null) {
      // Значение не равно null, поэтому можно получить данные.
      var origin = snapshot.value["origin"];
      // Делайте что-то с переменной origin, например, выводите ее на консоль.
      print("Origin: $origin");
    } else {
      // Значение равно null, что может означать отсутствие данных.
      Fluttertoast.showToast(msg: "Данные не существуют");
    }
  } catch (error) {
    // Обработка ошибок, если запрос к базе данных не удался.
    print("Произошла ошибка: $error");
  }
}
*/
//Обратите внимание, что теперь .then() принимает анонимную функцию, которая принимает аргумент DataSnapshot snapshot, представляющий снимок данных. Вы можете использовать этот снимок для получения значения "origin" и выполнения необходимых действий. Также, если произойдет ошибка при запросе к базе данных, вы можете обработать ее с помощью .catchError().






  Future  generateAndGetToken() async {
    String? registrationToken = await messaging.getToken();
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
        print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    print('asdasddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');

    print(registrationToken);
    FirebaseDatabase.instance
        .ref()
        .child('Xaydovchilar')
        .child(currentFireBaseUser!.uid)
        .child("token")
        .set(registrationToken);
    messaging.subscribeToTopic("Xaydovchilar");
    messaging.subscribeToTopic("users");
    
  }
}
//}

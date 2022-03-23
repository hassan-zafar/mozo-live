import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mozolive/Constants/constants.dart';
import 'package:mozolive/Routes/routes.dart';
import 'package:mozolive/Theme/style.dart';
import 'package:mozolive/controllers/auth_controller.dart';
import 'package:mozolive/views/screens/AuthNew/welcome.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  "high_importance_channel",
  "High Importance Notifications",
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51JvN23LbLnT1uHuWgwACQH9Gm250Q9FG4q8dZG5EmNR5Brlhysq3DEAiwZLDICwGiotd5Ux1wmJ12zGv4l0xVwtz00tY9V2jDN';

  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
Locale locale=const Locale('en');
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shifttie',locale:locale ,
      theme: appTheme,
      home: const WelcomescreenWidget(),
      routes: PageRoutes().routes(),
    );
  }
}

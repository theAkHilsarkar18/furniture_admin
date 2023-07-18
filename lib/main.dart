

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/about/aboutscreen.dart';
import 'package:furniture_admin/screens/add/view/addscree.dart';
import 'package:furniture_admin/screens/admindetail/view/admin.dart';
import 'package:furniture_admin/screens/home/view/homescreen.dart';
import 'package:furniture_admin/screens/signin/view/signin.dart';
import 'package:furniture_admin/screens/signin/view/signup.dart';
import 'package:furniture_admin/screens/splesh/view/spleshscreen.dart';
import 'package:furniture_admin/screens/update/view/updatescreen.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:furniture_admin/utils/firebase_notification.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseNotification.firebaseNotification.initNotification();
  await FirebaseNotification.firebaseNotification.initFirebaseMessaging();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splesh',
        getPages: [
          GetPage(name: '/', page:() => HomeScreen()),
          GetPage(name: '/signin', page:() => SigninScreen()),
          GetPage(name: '/signup', page:() => SignupScreen()),
          GetPage(name: '/add', page:() => AddScreen()),
          GetPage(name: '/update', page:() => UpdateScreen()),
          GetPage(name: '/admin', page:() => AdminScreen()),
          GetPage(name: '/splesh', page:() => SpleshScreen()),
          GetPage(name: '/about', page:() => AboutScreen()),

        ],
      ),
    ),
  );
}
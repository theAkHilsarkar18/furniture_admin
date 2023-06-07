import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:furniture_admin/utils/firebase_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readProductData(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Text('${snapshot.error}');
              }
            else if(snapshot.hasData)
              {
                QuerySnapshot? querySnapshot = snapshot.data;
                for(var x in querySnapshot!.docs)
                  {
                    Map data = x.data() as Map;
                    // return Text('${data}');
                  }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: ()  {

                         FirebaseNotification.firebaseNotification.showSimpleNotification();

                      }, child: Text('Simple Notification')),

                      ElevatedButton(onPressed: ()  {

                        FirebaseNotification.firebaseNotification.scheduleNotification();

                      }, child: Text('Schedule Notification')),

                      ElevatedButton(onPressed: ()  {

                        FirebaseNotification.firebaseNotification.showBigPictureNotification();

                      }, child: Text('Picture Notification')),

                      ElevatedButton(onPressed: ()  async {

                        await FirebaseNotification.firebaseNotification.initFirebaseMessaging();

                      }, child: Text('Firebase Notification')),
                    ],
                  ),
                );
              }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

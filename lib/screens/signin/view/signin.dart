import 'package:flutter/material.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: txtEmail),
            TextField(controller: txtPassword,),
            ElevatedButton(onPressed: () async {
              String email = txtEmail.text;
              String password = txtPassword.text;
              String msg = await FirebaseHelper.firebaseHelper.signIn(email: email, password: password);

              if(msg=='Success')
                {
                  Get.snackbar('Login Success !','');
                }
              else
                {
                  Get.snackbar('error 401','$msg');
                }

            }, child: Text('SignIn')),
            ElevatedButton(onPressed: () async {
              String msg = await FirebaseHelper.firebaseHelper.googleSignIn();
              if(msg=='Success')
              {
                Get.snackbar('Login Success !','');
              }
              else
              {
                Get.snackbar('error 401','$msg');
              }
            }, child: Text('Google')),
            ElevatedButton(onPressed: () {
              FirebaseHelper.firebaseHelper.signOut();
            }, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}

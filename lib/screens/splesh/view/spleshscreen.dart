import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  bool isLogin = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin = FirebaseHelper.firebaseHelper.checkUser();

  }
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed(isLogin?'/home':'/signin');
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Container(height: 15.h,
              child: Image.asset('assets/add/app.jpg')),
              Text('Admin',style: GoogleFonts.poppins(color: Colors.black,letterSpacing: 1)),

              Spacer(),
              Text('by theakhilsarkar',style: GoogleFonts.poppins(color: Colors.grey)),
              SizedBox(height: 1.h,),
            ],
          ),
        ),
      ),
    );
  }
}

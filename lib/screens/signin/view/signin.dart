import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';
import '../controller/signincontroller.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  SigninController signinController = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/signin/pattern.png'),
                SizedBox(height: 5.h,),
                Center(
                  child: Text(
                    'Hello, Welcome back',
                    style: GoogleFonts.overpass(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Partner !',
                    style: GoogleFonts.actor(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 1
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                // TODO textfield for email
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtEmail,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('Email',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width: 0.5),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 0.5.h,),
                // TODO textfield for mobile
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: TextFormField(
                //     controller: txtPhone,
                //     keyboardType: TextInputType.emailAddress,
                //     cursorColor: Colors.black,
                //     style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.call,color: Colors.grey),
                //       // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                //       label: Text('Mobile number',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10),
                //           borderSide: BorderSide(color: Colors.grey)
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(10),
                //         borderSide: BorderSide(color: Colors.grey,width: 0.5),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 0.5.h,),
                // TODO textfield for password
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                        () => TextFormField(
                      controller: txtPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: signinController.isVisible.value,
                      obscuringCharacter: '#',
                      cursorColor: Colors.black,
                      style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        suffixIcon: InkWell(onTap: () {
                          signinController.visibilityChangeOfPassword();
                        },child: signinController.isVisible.isTrue?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
                        label: Text('Password',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey,width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text('Forgot Password',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 14,letterSpacing: 1))),
                SizedBox(height: 20,),
                InkWell(onTap: () async {
                  String email = txtEmail.text;
                  String password = txtPassword.text;
                  String phone = txtPhone.text;
                  if(email.isEmpty && password.isEmpty)
                  {
                    Get.snackbar('Email and Password are empty', 'Please enter a valid email and password!');
                  }
                  else if(email.isEmpty)
                  {
                    Get.snackbar('Email is empty', 'Please enter email address !');
                  }
                  else if(password.isEmpty)
                  {
                    Get.snackbar('Password is empty', 'Please enter password !');
                  }
                  // else if(phone.isEmpty)
                  //   {
                  //     Get.snackbar('Mobile number is empty', 'Please enter password !');
                  //   }
                  else if(email.isNotEmpty && password.isNotEmpty)
                  {
                    String msg = await FirebaseHelper.firebaseHelper.signIn(email: email, password: password);
                    if(msg=='Success')
                    {
                      Get.offAndToNamed('/home');
                    }
                    else
                    {
                      Get.snackbar('error 401', '$msg');
                    }
                  }

                },child: signInBox()),
                SizedBox(height: 20,),
                InkWell(onTap: () {
                  Get.toNamed('/signup');
                },child: Center(child: Text('Sign Up',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 14,letterSpacing: 1)))),
                SizedBox(height: 20,),
                // Text('OR',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 10,letterSpacing: 1)),
                // InkWell(onTap: () async {
                //   String msg = await FirebaseHelper.firebaseHelper.googleSignIn();
                //   if(msg=='Success')
                //   {
                //     Get.offAndToNamed('/bar');
                //   }
                //   else
                //   {
                //     Get.snackbar('error 12501', '$msg');
                //   }
                // },child: Image.asset('assets/signin/google.png',height: 50,)),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget signInBox()
  {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,bottom: 10),
      height: 6.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text('Log in',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/firebase_helper.dart';
import '../controller/signupcontroller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPan = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtGSTno = TextEditingController();
  SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Image.asset('assets/signin/pattern.png'),
                SizedBox(height: 2.h,),
                Center(
                  child: Text(
                    'Become a Partner !',
                    style: GoogleFonts.actor(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        letterSpacing: 1
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                // TODO textfield for name
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtName,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('Name',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                // TODO textfield for MOBILE number
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtPhone,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.phone,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('Mobile number',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                // TODO textfield for PAN detail
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtPan,
                    maxLength:10,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.credit_score,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('PAN no.',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                // TODO textfield for GST detail
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtGSTno,
                    maxLength:15,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.gavel_outlined,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('GST no.',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                // TODO textfield for address address
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtAddress,
                    keyboardType: TextInputType.streetAddress,
                    maxLength:100,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.home_outlined,color: Colors.grey),
                      // suffixIcon: Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                      label: Text('Address',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                // TODO textfield for password
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                        () => TextFormField(
                      controller: txtPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: signupController.isVisible1.value,
                      obscuringCharacter: '#',
                      cursorColor: Colors.black,
                      style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline,color: Colors.grey),
                        suffixIcon: InkWell(onTap: () {
                          signupController.visibilityChangeOfPassword1();
                        },child: signupController.isVisible1.isTrue?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
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
                // TODO textfield for confirm password
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                        () => TextFormField(
                      controller: txtConfPassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: signupController.isVisible2.value,
                      obscuringCharacter: '#',
                      cursorColor: Colors.black,
                      style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        suffixIcon: InkWell(onTap: () {
                          signupController.visibilityChangeOfPassword2();
                        },child: signupController.isVisible2.isTrue?Icon(Icons.visibility_off,color: Colors.grey):Icon(Icons.visibility,color: Colors.grey)),
                        label: Text('Confirm Password',style: GoogleFonts.overpass(color: Colors.grey,fontSize: 15,letterSpacing: 1)),
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
                SizedBox(height: 3.h,),
                InkWell(onTap: () async {

                  String pass1 = txtPassword.text;
                  String confpass = txtConfPassword.text;
                  if(pass1==confpass)
                  {

                    String name = txtName.text;
                    String email = txtEmail.text;
                    String phone = txtPhone.text;
                    String pan = txtPan.text;
                    String gst = txtGSTno.text;
                    String address = txtAddress.text;
                    String password = txtPassword.text;

                    Map<String,dynamic> m1 = {
                      'name':name,
                      'email':email,
                      'phone':phone,
                      'pan':pan,
                      'gst':gst,
                      'address':address,
                      'password':password,
                    };
                    FirebaseHelper.firebaseHelper.addAdminProfileData(m1);

                    String msg = await FirebaseHelper.firebaseHelper.signUp(email: email, password: password, name: name);
                    if(msg=='Success')
                    {
                      print('$msg');
                      Get.back();
                    }
                    else
                    {
                      Get.snackbar('error 401', '$msg');
                    }
                  }
                  else
                  {
                    Get.snackbar('error 401', 'Password and confirm password does not match !');
                  }




                },child: signUpBox()),
                SizedBox(height: 3.h,),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have partner account ? ',style: GoogleFonts.poppins(color: Colors.black54,fontSize: 12,letterSpacing: 1)),
                      Text('Sign In',style: GoogleFonts.poppins(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: 1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget signUpBox()
  {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 25,bottom: 10),
      height: 6.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text('Sign up',style: GoogleFonts.overpass(color: Colors.white,letterSpacing: 1,fontSize: 13.sp)),
    );
  }

}
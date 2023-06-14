import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/home/view/homescreen.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

TextEditingController txtPhone = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtPan = TextEditingController();
TextEditingController txtAddress = TextEditingController();
TextEditingController txtGSTno = TextEditingController();


class _AdminScreenState extends State<AdminScreen> {
  late String email;
  late String password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseHelper.firebaseHelper.getUserId();
    FirebaseHelper.firebaseHelper.getUserDetail();
    Map m1 = Get.arguments;
    email = m1['email'];
    password = m1['password'];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset('assets/signin/pattern.png'),
                SizedBox(height: 2.h,),
                Center(
                  child: Text(
                    'Add Detail !',
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
                          borderSide: BorderSide(color: Colors.grey,width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width: 1),
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
                          borderSide: BorderSide(color: Colors.grey,width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width: 1),
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
                          borderSide: BorderSide(color: Colors.grey,width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width:1),
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
                          borderSide: BorderSide(color: Colors.grey,width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width:1),
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
                          borderSide: BorderSide(color: Colors.grey,width: 1.5)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey,width: 1),
                      ),
                    ),
                  ),
                ),
                Align(heightFactor: 0.6.h,child: InkWell(onTap: ()  {

                  String name = txtName.text;
                  String phone = txtPhone.text;
                  String pan = txtPan.text;
                  String gst = txtGSTno.text;
                  String address = txtAddress.text;
                  String adminId = homeController.adminId.value;

                  Map<String,dynamic> m1 = {
                    'adminId' : adminId,
                    'name':name,
                    'password':password,
                    'email':email,
                    'phone':phone,
                    'pan':pan,
                    'gst':gst,
                    'address':address,
                  };
                  FirebaseHelper.firebaseHelper.addAdminProfileData(m1);
                  Get.back();
                },child: signUpBox())),
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
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
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

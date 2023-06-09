import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/home/model/homemodel.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  TextEditingController txtRating = TextEditingController();
  TextEditingController txtStock = TextEditingController();
  TextEditingController txtCategoryId = TextEditingController();
  TextEditingController txtImg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Add Products',
              style: GoogleFonts.overpass(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.grey)
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.category_outlined,color: Colors.black54,),
                          SizedBox(width: 2.w,),
                          Text('Product category',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1)),
                          Spacer(),
                          InkWell(onTap: () {
                            // open category bottom-sheet
                          },child: Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black54,)),

                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtName,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.chair_outlined),
                      label: Text('Product name',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1.5)),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtPrice,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      label: Text('Product price',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1)),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    maxLines: 2,
                    controller: txtDesc,
                    maxLength: 150,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.description_outlined),
                      label: Text('Product Description',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1)),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtStock,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.auto_graph_rounded),
                      label: Text('Product stock',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1)),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: txtImg,
                    keyboardType: TextInputType.url,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(letterSpacing: 1,color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.image_outlined),
                      label: Text('Product Image URL',style: GoogleFonts.overpass(color: Colors.black87,fontSize: 12.sp,letterSpacing: 1)),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 20.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1,color: Colors.grey)
                    ),
                    child: Container(height:10.h,child: Image.asset('assets/add/img.png',)),
                  )
                ),

                ElevatedButton(
                  onPressed: () {
                    // String pname = txtName.text;
                    //
                    // Map<String,dynamic> m1 = {
                    //   'description': txtDesc.text,
                    //   'categoryId': txtCategoryId.text,
                    //   'img': txtImg.text,
                    //   'name': txtName.text,
                    //   'price': txtPrice.text,
                    //   'rating': txtRating.text,
                    //   'stock': txtStock.text,
                    // };
                    // FirebaseHelper.firebaseHelper.addProduct(m1);
                    // Get.toNamed('/home');
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

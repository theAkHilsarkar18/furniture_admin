import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/add/controller/addcontroller.dart';
import 'package:furniture_admin/screens/home/controller/homecontroller.dart';
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

  AddController addController = Get.put(AddController());
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseHelper.firebaseHelper.getUserDetail();
  }
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
                        border: Border.all(width: 1, color: Colors.grey)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            addController.selectedCategory.value==''?Text('Product category',
                                style: GoogleFonts.overpass(
                                    color: Colors.black87,
                                    fontSize: 12.sp,
                                    letterSpacing: 1)):Obx(
                                      () =>  Text('${addController.selectedCategory.value}',
                                style: GoogleFonts.overpass(
                                      color: Colors.black87,
                                      fontSize: 12.sp,
                                      // fontWeight: FontWeight.w500,
                                      letterSpacing: 1)),
                                    ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  // open category bottom-sheet
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(10)),
                                    builder: (context) => Container(height: 13.h,child: categoryBox()),
                                  );
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.black54,
                                )),
                          ],
                        ),
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
                    style: GoogleFonts.overpass(
                        letterSpacing: 1, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.inventory_outlined),
                      label: Text('Product name',
                          style: GoogleFonts.overpass(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              letterSpacing: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
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
                    style: GoogleFonts.overpass(
                        letterSpacing: 1, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      label: Text('Product price',
                          style: GoogleFonts.overpass(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
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
                    style: GoogleFonts.overpass(
                        letterSpacing: 1, color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      prefixIcon: Icon(Icons.description_outlined),
                      label: Text('Product Description',
                          style: GoogleFonts.overpass(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
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
                    style: GoogleFonts.overpass(
                        letterSpacing: 1, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.auto_graph_rounded),
                      label: Text('Product stock',
                          style: GoogleFonts.overpass(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value) {
                      addController.imgLink.value = value;
                    },
                    controller: txtImg,
                    keyboardType: TextInputType.url,
                    cursorColor: Colors.black,
                    style: GoogleFonts.overpass(
                        letterSpacing: 1, color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.image_outlined),
                      label: Text('Product Image URL',
                          style: GoogleFonts.overpass(
                              color: Colors.black87,
                              fontSize: 12.sp,
                              letterSpacing: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 20.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    child: Obx(
                      () => Container(
                        height: 17.h,
                        // width: 35.w,
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: addController.imgLink.value == ''
                            ? Image.asset('assets/add/img.png')
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${addController.imgLink.value}',
                                  fit: BoxFit.cover,
                                )),
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Map<String, dynamic> m1 = {
                        'description': txtDesc.text,
                        'categoryId': addController.categoryIndex.value,
                        'img': txtImg.text,
                        'name': txtName.text,
                        'price': int.parse(txtPrice.text),
                        'rating': '4',
                        'stock': txtStock.text,
                        'adminId': '${homeController.adminId.value}',
                      };

                      FirebaseHelper.firebaseHelper.addProductDetail(m1);
                      Get.back();
                    },
                    child: addProductBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget categoryBox() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: addController.categoryList.length,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            addController.selectCategory('${addController.categoryNameList[index]}',index);
            print('${addController.selectedCategory.value}---------selected category');
            Get.back();
          },
          child: CircleAvatar(
            backgroundColor: Colors.black87,
            radius: 32.sp,
            child: Container(
              margin: EdgeInsets.all(10),
                height: 10.h,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    addController.categoryList[index],
                    SizedBox(height: 2,),
                    Text('${addController.categoryNameList[index]}', style: GoogleFonts.overpass(fontSize: 10.sp,color: Colors.white)),
                  ],
                )),
          ),
        ),
      ),
    );
  }



  Widget addProductBox() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 20),
      height: 6.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text('Add product',
          style: GoogleFonts.overpass(
              color: Colors.white, letterSpacing: 1, fontSize: 13.sp)),
    );
  }
}

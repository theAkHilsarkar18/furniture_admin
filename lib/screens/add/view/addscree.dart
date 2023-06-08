import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/home/model/homemodel.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:get/get.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: txtName,
            ),
            TextField(
              controller: txtPrice,
            ),
            TextField(
              controller: txtDesc,
            ),
            TextField(
              controller: txtRating,
            ),
            TextField(
              controller: txtCategoryId,
            ),
            TextField(
              controller: txtImg,
            ),
            TextField(
              controller: txtStock,
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
    );
  }
}

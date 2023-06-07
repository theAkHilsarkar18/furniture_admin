import 'package:flutter/material.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(controller: txtName,),
            TextField(controller: txtPrice,),
            TextField(controller: txtDesc,),
            TextField(controller: txtRating,),
            ElevatedButton(onPressed: () {
              String pname = txtName.text;
              Map<String,dynamic> m1 = {'name':'$pname','price':12000,'desc':'a product is good','rating':4.5};
              FirebaseHelper.firebaseHelper.addProduct(pname,m1);
            }, child: Text('Add'),),
          ],
        ),
      ),
    );
  }
}

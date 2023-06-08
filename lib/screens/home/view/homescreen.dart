import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/home/model/homemodel.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:furniture_admin/utils/firebase_notification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('Products',
              style: GoogleFonts.overpass(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readProductData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              List<HomeModel> productList = [];
              QuerySnapshot? querySnapshot = snapshot.data;
              for (var x in querySnapshot!.docs) {
                Map data = x.data() as Map;
                HomeModel h1 = HomeModel(
                  name: data['name'],
                  price: data['price'],
                  description: data['description'],
                  img: data['img'],
                  stock: int.parse(data['stock']),
                  rating: int.parse(data['rating']),
                  categoryId: data['categoryId'],
                );
                productList.add(h1);
              }
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => productBox(
                  productList[index].img!,
                  productList[index].name!,
                  productList[index].description!,
                  productList[index].stock!,
                  productList[index].categoryId!,
                  productList[index].rating!,
                  productList[index].price!,
                ),
                itemCount: productList.length,
              );

              // return ListView.builder(itemBuilder: (context, index) => Text('data'),itemCount: 5,);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget productBox(String img, String name, String desc, int stock,
      String categoryId, int rating, String price) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5.sp),
      height: 21.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 12.h,
                width: 25.w,
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      '$img',
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 3.w,
              ),
              Container(
                width: 60.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Text(
                      '${name}',
                      style: GoogleFonts.overpass(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          'Stock : ',
                          style: GoogleFonts.overpass(
                            color: Colors.grey,
                            fontSize: 10.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        stock != 0
                            ? Text(
                                '${stock}',
                                style: GoogleFonts.overpass(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                'out of stock',
                                style: GoogleFonts.overpass(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Category : ',
                          style: GoogleFonts.overpass(
                            color: Colors.grey,
                            fontSize: 10.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        categoryId == '1'
                            ? Text(
                                'Sofa',
                                style: GoogleFonts.overpass(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                ),
                              )
                            : categoryId=='2'?Text(
                                'Arm chair',
                                style: GoogleFonts.overpass(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                ),
                              ):Text(
                          'Bed',
                          style: GoogleFonts.overpass(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${desc}!',
                      style: GoogleFonts.overpass(
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 27.w,
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < rating; i++)
                      Icon(
                        Icons.star,
                        size: 10.sp,
                        color: Colors.amber,
                      ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 27.w,
                padding: EdgeInsets.all(5),
                child: Text(
                  '\$ ${price}/-',
                  style: GoogleFonts.overpass(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              InkWell(onTap: () {
                // delete method
              },child: Icon(Icons.delete,size: 18.sp,color: Colors.grey)),
              SizedBox(width: 3.w,),
              InkWell(onTap: () {
                // edit method
              },child: Icon(Icons.edit_square,size: 16.sp,color: Colors.grey,)),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}

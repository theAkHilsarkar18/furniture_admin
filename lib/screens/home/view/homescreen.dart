import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_admin/screens/add/controller/addcontroller.dart';
import 'package:furniture_admin/screens/home/controller/homecontroller.dart';
import 'package:furniture_admin/screens/home/model/homemodel.dart';
import 'package:furniture_admin/utils/firebase_helper.dart';
import 'package:furniture_admin/utils/firebase_notification.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

HomeController homeController = Get.put(HomeController());
AddController addController = Get.put(AddController());

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            addController.imgLink.value = '';
            addController.selectedCategory.value = '';
            print('${addController.imgLink.value} ===img link ===========');
            Get.toNamed('/add');
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
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
              QuerySnapshot? querySnapshot = snapshot.data;
              homeController.productList.clear();
              for (var x in querySnapshot!.docs) {
                Map data = x.data() as Map;
                HomeModel h1 = HomeModel(
                    productId: x.id,
                    name: data['name'],
                    price: data['price'],
                    description: data['description'],
                    img: data['img'],
                    stock: int.parse(data['stock']),
                    rating: int.parse(data['rating']),
                    categoryId: data['categoryId'],
                    adminId: '${homeController.adminId.value}');

                homeController.productList.add(h1);
              }
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => productBox(
                  index,
                  homeController.productList[index].img!,
                  homeController.productList[index].name!,
                  homeController.productList[index].description!,
                  homeController.productList[index].stock!,
                  homeController.productList[index].categoryId!,
                  homeController.productList[index].rating!,
                  homeController.productList[index].price!,
                ),
                itemCount: homeController.productList.length,
              );

              // return ListView.builder(itemBuilder: (context, index) => Text('data'),itemCount: 5,);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget productBox(int index, String img, String name, String desc, int stock,
      int categoryId, int rating, String price) {
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
                    SizedBox(
                      height: 5,
                    ),
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
                        categoryId == 1
                            ? Text(
                                'Sofa',
                                style: GoogleFonts.overpass(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10.sp,
                                ),
                              )
                            : categoryId == 2
                                ? Text(
                                    'Arm chair',
                                    style: GoogleFonts.overpass(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                    ),
                                  )
                                : Text(
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
              InkWell(
                onTap: () {
                  // delete method
                  String? docId = homeController.productList[index].productId;
                  FirebaseHelper.firebaseHelper.deleteProduct(docId!);
                },
                child: Icon(
                  Icons.delete,
                  size: 18.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              InkWell(
                onTap: () {
                  // edit method
                },
                child: Icon(
                  Icons.edit_square,
                  size: 16.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.2),
        ],
      ),
    );
  }
}

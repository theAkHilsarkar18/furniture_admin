import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddController extends GetxController
{
  RxString imgLink = ''.obs;
  RxString categoryIndex = ''.obs;
  RxString selectedCategory = ''.obs;

  void selectCategory(String category)
  {
    selectedCategory.value = category;
  }

  List<Icon> categoryList = [
    Icon(Icons.chair_outlined,color: Colors.white,size: 35),
    Icon(Icons.bed_outlined,color: Colors.white,size: 35),
    Icon(Icons.weekend_outlined,color: Colors.white,size: 35),
    Icon(Icons.light,color: Colors.white,size: 35),
    Icon(Icons.grass_outlined,color: Colors.white,size: 35),
    Icon(Icons.bathtub_outlined,color: Colors.white,size: 35),
    Icon(Icons.dining_outlined,color: Colors.white,size: 35),
    Icon(Icons.window_outlined,color: Colors.white,size: 35),
    Icon(Icons.tv,color: Colors.white,size: 35),
  ];

  List categoryNameList = [
    'Chair',
    'Bed',
    'Armchair',
    'Lights',
    'Trees',
    'Bathroom',
    'Kitchen',
    'Window',
    'TV',
  ];
}
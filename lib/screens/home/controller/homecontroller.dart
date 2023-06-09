import 'package:furniture_admin/screens/home/model/homemodel.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  RxString adminId = ''.obs;
  RxString productId = ''.obs;
  RxList<HomeModel> productList = <HomeModel>[].obs;
}
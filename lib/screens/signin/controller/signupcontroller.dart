import 'package:get/get.dart';

class SignupController extends GetxController
{
  RxBool isVisible1 = true.obs;
  void visibilityChangeOfPassword1()
  {
    isVisible1.value = !isVisible1.value;
  }

  RxBool isVisible2 = true.obs;
  void visibilityChangeOfPassword2()
  {
    isVisible2.value = !isVisible2.value;
  }
}
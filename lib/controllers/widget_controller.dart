import 'package:get/get.dart';

class WidgetController extends GetxController {
  RxInt currentIndex = 0.obs;

  RxBool visibility = true.obs;

  bool obscureStatus() {
    return visibility.value = !visibility.value;
  }
}

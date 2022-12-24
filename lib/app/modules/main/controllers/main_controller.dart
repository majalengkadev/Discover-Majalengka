import 'package:get/get.dart';

class MainController extends GetxController {
  final tabActive = 0.obs;

  setTabActive(int index) {
    tabActive.value = index;
  }
}

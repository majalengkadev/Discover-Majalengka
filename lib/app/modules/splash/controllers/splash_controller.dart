import 'package:discover_majalengka/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    gotoPage();
    super.onInit();
  }

  gotoPage() {
    Future.delayed(
      const Duration(milliseconds: 1100),
      () {
        Get.offNamed(Routes.MAIN);
      },
    );
  }
}

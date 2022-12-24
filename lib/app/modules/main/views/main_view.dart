import 'package:discover_majalengka/app/modules/home/views/home_view.dart';
import 'package:discover_majalengka/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import 'widgets/bottom_menu.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: backgroundColor,
        body: Obx(
          () => getPage(controller.tabActive.value),
        ),
        bottomNavigationBar: BottomMenu(
          currentTab: controller.tabActive.value,
          onSelectTab: controller.setTabActive,
        ),
      ),
    );
  }
}

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    title: Image.asset(
      "assets/images/logo.png",
      height: 36,
    ),
    actions: [
      Container(
        child: IconButton(
          icon: const Icon(Icons.notifications_rounded, color: taelColor),
          onPressed: () {},
        ),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          //border: Border.all(color: Colors.black12, width: 1),
        ),
      ),
    ],
  );
}

Widget getPage(int index) {
  if (index == 0) {
    return const HomeView();
  } else {
    return const Center(
      child: Text(
        "Halaman belum di implementasi",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

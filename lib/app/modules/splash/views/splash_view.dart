import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 250,
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
                child: Text(
              "MajalengkaDev",
              style: TextStyle(
                color: Colors.black38,
              ),
            )),
          )
        ],
      ),
    );
  }
}

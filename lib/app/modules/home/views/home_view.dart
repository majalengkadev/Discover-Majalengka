import 'package:discover_majalengka/app/modules/home/views/widgets/konten_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'widgets/kategori_widget.dart';
import 'widgets/search_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchWidget(),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 72,
            child: KategoriWidget(),
          ),
          const SizedBox(
            height: 16,
          ),
          KontenWidget()
        ],
      ),
    );
  }
}

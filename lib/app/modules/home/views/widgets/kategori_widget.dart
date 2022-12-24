import 'package:discover_majalengka/app/modules/home/controllers/home_controller.dart';
import 'package:discover_majalengka/helpers/components/show_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'kategori_item.dart';

class KategoriWidget extends StatelessWidget {
  KategoriWidget({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ShowPage(
        status: controller.statusKoneksi.value,
        error: controller.error.value,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = controller.data[index];
            return KategoriItem(item: item);
          },
        ),
      ),
    );
  }
}

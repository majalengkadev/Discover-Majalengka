import 'package:discover_majalengka/app/modules/detail/controllers/detail_controller.dart';
import 'package:discover_majalengka/app/modules/detail/views/widgets/detail_item.dart';
import 'package:discover_majalengka/helpers/components/show_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({Key? key}) : super(key: key);

  final controller = Get.find<DetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ShowPage(
        status: controller.statusKoneksi.value,
        error: controller.error.value,
        child: DetailItem(konten: controller.konten),
      ),
    );
  }
}

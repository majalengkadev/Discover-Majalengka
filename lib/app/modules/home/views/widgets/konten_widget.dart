import 'package:discover_majalengka/app/modules/home/controllers/home_controller.dart';
import 'package:discover_majalengka/app/modules/home/views/widgets/konten_item.dart';
import 'package:discover_majalengka/helpers/components/show_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KontenWidget extends StatelessWidget {
  KontenWidget({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ShowPage(
        status: controller.statusKoneksiKonten.value,
        error: controller.errorKontent.value,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.dataKonten.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = controller.dataKonten[index];
            return InkWell(
              onTap: () {
                controller.gotoDetail(item.slug);
              },
              child: KontenItem(konten: item),
            );
          },
        ),
      ),
    );
  }
}

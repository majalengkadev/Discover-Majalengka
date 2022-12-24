import 'package:discover_majalengka/app/data/models/kategori.dart';
import 'package:discover_majalengka/app/data/models/konten.dart';
import 'package:discover_majalengka/app/data/repositories/main_repo.dart';
import 'package:discover_majalengka/helpers/api.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../detail/controllers/detail_controller.dart';

class HomeController extends GetxController {
  var error = ''.obs;
  var statusKoneksi = StatusKoneksi.loading.obs;
  var data = <Kategori>[].obs;

  var errorKontent = ''.obs;
  var statusKoneksiKonten = StatusKoneksi.loading.obs;
  var dataKonten = <Konten>[].obs;

  @override
  void onInit() {
    getKategori();
    getKonten();
    super.onInit();
  }

  getKategori() {
    MainRepo().getKategori(beforeSend: () {
      dataKonten.clear();
      statusKoneksi.value = StatusKoneksi.loading;
    }, onSuccess: (respon) {
      data.addAll(respon.listData as List<Kategori>);
      statusKoneksi.value = StatusKoneksi.done;
    }, onError: (error) {
      statusKoneksi.value = StatusKoneksi.error;
      error.value = error;
    });
  }

  getKonten() {
    MainRepo().getKonten(beforeSend: () {
      dataKonten.clear();
      statusKoneksiKonten.value = StatusKoneksi.loading;
    }, onSuccess: (respon) {
      dataKonten.addAll(respon.listData as List<Konten>);
      statusKoneksiKonten.value = StatusKoneksi.done;
    }, onError: (error) {
      statusKoneksiKonten.value = StatusKoneksi.error;
      errorKontent.value = error;
    });
  }

  gotoDetail(String slug) {
    Get.find<DetailController>().setSlug(slug);
    Get.toNamed(Routes.DETAIL);
  }
}

import 'package:discover_majalengka/app/data/models/konten.dart';
import 'package:discover_majalengka/app/data/repositories/main_repo.dart';
import 'package:discover_majalengka/helpers/api.dart';
import 'package:discover_majalengka/helpers/rb_helpers.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  var error = ''.obs;
  var statusKoneksi = StatusKoneksi.loading.obs;
  Konten? konten;
  var slug = ''.obs;

  setSlug(String v) {
    slug.value = v;
    getData();
  }

  getData() {
    MainRepo().getDetail(slug.value, beforeSend: () {
      statusKoneksi.value = StatusKoneksi.loading;
    }, onSuccess: (respon) {
      konten = null;
      konten = respon.data as Konten;
      statusKoneksi.value = StatusKoneksi.done;
    }, onError: (error) {
      statusKoneksi.value = StatusKoneksi.error;
      error.value = error;
    });
  }
}

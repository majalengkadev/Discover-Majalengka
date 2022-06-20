import 'package:discover_majalengka/models/kategori.dart';
import 'package:discover_majalengka/models/konten.dart';

import '../helpers/api.dart';
import '../models/respon_data.dart';

class MainRepo {
  final api = Api();

  Future<ResponData> getKategori() async {
    final responData = ResponData();
    final result = await api.get("kategori");

    responData.pesan = result['message'];

    final data = result['data']['data'];
    final list = <Kategori>[];
    for (var d in data) {
      list.add(Kategori.fromMap(d));
    }
    responData.listData = list;
    return responData;
  }

  Future<ResponData> getKonten({Map<String, String>? params}) async {
    final responData = ResponData();
    final result = await api.get("konten");

    responData.pesan = result['message'];

    final data = result['data']['data'];
    final list = <Konten>[];
    for (var d in data) {
      list.add(Konten.fromMap(d));
    }
    responData.listData = list;
    return responData;
  }

  Future<ResponData> getDetail(String slug) async {
    final responData = ResponData();
    final result = await api.get("konten/$slug");
    print(result);

    responData.pesan = result['message'];
    final data = Konten.fromMap(result['data']);
    responData.data = data;
    return responData;
  }
}

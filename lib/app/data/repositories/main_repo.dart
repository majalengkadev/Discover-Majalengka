import '../../../helpers/api.dart';
import '../models/kategori.dart';
import '../models/konten.dart';
import '../models/respon_data.dart';

class MainRepo {
  final api = Api();
  getKategori(
      {Function()? beforeSend,
      required Function(ResponData respon) onSuccess,
      Function(dynamic error)? onError}) {
    api.get('kategori',
        onError: (e) => {if (onError != null) onError(e)},
        onSuccess: (respon) {
          final responData = ResponData();
          responData.pesan = respon['message'];

          final data = respon['data']['data'];
          final list = <Kategori>[];
          for (var d in data) {
            list.add(Kategori.fromMap(d));
          }
          responData.listData = list;
          onSuccess(responData);
        });
  }

  getKonten(
      {Function()? beforeSend,
      required Function(ResponData respon) onSuccess,
      Function(dynamic error)? onError}) {
    api.get('konten',
        onError: (e) => {if (onError != null) onError(e)},
        onSuccess: (respon) {
          final responData = ResponData();
          responData.pesan = respon['message'];

          final data = respon['data']['data'];
          final list = <Konten>[];
          for (var d in data) {
            list.add(Konten.fromMap(d));
          }
          responData.listData = list;
          onSuccess(responData);
        });
  }

  getDetail(String slug,
      {Function()? beforeSend,
      required Function(ResponData respon) onSuccess,
      Function(dynamic error)? onError}) {
    api.get('konten/$slug',
        onError: (e) => {if (onError != null) onError(e)},
        onSuccess: (respon) {
          final responData = ResponData();

          responData.pesan = respon['message'];
          responData.data = Konten.fromMap(respon['data']);

          onSuccess(responData);
        });
  }
}

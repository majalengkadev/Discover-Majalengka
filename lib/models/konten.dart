import 'package:discover_majalengka/models/kategori.dart';

class Konten {
  final String nama;
  final String slug;
  final String image;
  final String latitude;
  final String longitude;
  final String desa;
  final String kecamatan;
  final String keterangan;
  final List<Kategori> kategori;

  Konten({
    required this.nama,
    required this.slug,
    required this.image,
    required this.latitude,
    required this.longitude,
    required this.desa,
    required this.kecamatan,
    required this.kategori,
    required this.keterangan,
  });

  factory Konten.fromMap(Map<String, dynamic> map) {
    return Konten(
      nama: map['nama'] ?? '',
      slug: map['slug'] ?? '',
      image: map['cover']['image_url'] ?? '',
      keterangan: map['keterangan'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      desa: map['desa']['nama'] ?? '',
      kecamatan: map['kecamatan']['nama'] ?? '',
      kategori:
          List<Kategori>.from(map['kategori']?.map((x) => Kategori.fromMap(x))),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/helpers/constants.dart';
import 'package:discover_majalengka/models/konten.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class KontenDetail extends StatelessWidget {
  const KontenDetail({
    Key? key,
    required this.konten,
  }) : super(key: key);

  final Konten konten;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: konten.image,
          placeholder: (context, url) => const Loading(),
          errorWidget: (context, url, error) => const Icon(Icons.image),
          fit: BoxFit.cover,
          width: double.infinity,
          height: 500,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 24),
                child: Text(
                  konten.nama,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, top: 4, right: 16, bottom: 24),
                child: Row(
                  children: [
                    const Icon(
                      Icons.place,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${konten.desa}, ${konten.kecamatan}",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Kategori",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Wrap(
                            children:
                                List.generate(konten.kategori.length, (index) {
                              final kategori = konten.kategori[index];
                              return Container(
                                padding: const EdgeInsets.all(6),
                                margin: const EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: iconColor,
                                ),
                                child: Text(
                                  kategori.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Deskripsi",
                            style: TextStyle(fontSize: 18),
                          ),
                          Html(data: konten.keterangan),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 36,
            child: Center(
              child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(taelColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        // Change your radius here
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Get Direction",
                    style: TextStyle(fontSize: 18),
                  )),
            ))
      ],
    );
  }
}

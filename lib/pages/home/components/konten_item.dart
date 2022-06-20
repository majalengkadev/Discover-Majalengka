import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/models/konten.dart';
import 'package:flutter/material.dart';

class KontenItem extends StatelessWidget {
  const KontenItem({
    Key? key,
    required this.konten,
  }) : super(key: key);

  final Konten konten;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: konten.image,
                  placeholder: (context, url) => const Loading(),
                  errorWidget: (context, url, error) => const Icon(Icons.image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            konten.nama,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Icon(
                Icons.place,
                size: 16,
                color: Colors.black38,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "${konten.desa}, ${konten.kecamatan}",
                style: const TextStyle(color: Colors.black54),
              )
            ],
          )
        ],
      ),
    );
  }
}

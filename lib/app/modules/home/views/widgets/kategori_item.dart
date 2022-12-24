import 'package:cached_network_image/cached_network_image.dart';
import 'package:discover_majalengka/app/data/models/kategori.dart';
import 'package:flutter/material.dart';

class KategoriItem extends StatelessWidget {
  const KategoriItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Kategori item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 6,
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: item.image,
              imageBuilder: (context, imageProvider) => Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image,
                size: 48,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

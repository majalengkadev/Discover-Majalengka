import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class KategoriItem extends StatelessWidget {
  const KategoriItem({
    Key? key,
    required this.title,
    required this.image,
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Loading(),
              errorWidget: (context, url, error) => const Icon(Icons.image),
              fit: BoxFit.cover,
              width: 28,
              height: 22,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 14,
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      decoration: BoxDecoration(
          color: isActive ? taelColor : Colors.white,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}

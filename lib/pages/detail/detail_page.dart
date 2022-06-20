import 'package:discover_majalengka/helpers/constants.dart';

import 'package:flutter/material.dart';

import 'components/konten_widget.dart';

class DetailPage extends StatelessWidget {
  final String slug;
  const DetailPage({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          KontenWidget(
            slug: slug,
          ),
          appBar(context)
        ],
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(10),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 18,
          ),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Container(
          child: IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //border: Border.all(color: Colors.black12, width: 1),
          ),
        ),
      ],
    );
  }
}

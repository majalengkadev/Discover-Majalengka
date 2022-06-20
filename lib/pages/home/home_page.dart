import 'package:discover_majalengka/helpers/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/bottom_menu.dart';
import 'components/kategori_widget.dart';
import 'components/popular_widget.dart';
import 'components/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: appBar(),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SearchWidget(),
              KategoriWidget(),
              PopularWidget(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomMenu(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Discover",
            style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "Majalengka",
            style: TextStyle(
                fontSize: 24,
                color: Colors.black54,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
      actions: [
        Container(
          child: IconButton(
            icon: const Icon(Icons.notifications_rounded, color: taelColor),
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

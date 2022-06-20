import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/models/konten.dart';
import 'package:discover_majalengka/models/respon_data.dart';
import 'package:discover_majalengka/pages/detail/detail_page.dart';
import 'package:discover_majalengka/repositories/main_repo.dart';
import 'package:flutter/material.dart';

import 'konten_item.dart';

class PopularWidget extends StatefulWidget {
  const PopularWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularWidget> createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  final repo = MainRepo();
  late Future<ResponData> dataKonten;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Populer di Majalengka",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          showData()
        ],
      ),
    );
  }

  void getData() {
    setState(() {
      dataKonten = repo.getKonten();
    });
  }

  Widget showData() {
    return FutureBuilder<ResponData>(
        future: dataKonten,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.listData as List<Konten>;
            return GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(data.length, (index) {
                final konten = data[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(slug: konten.slug),
                      ),
                    );
                  },
                  child: KontenItem(konten: konten),
                );
              }),
            );
          }

          return Container();
        });
  }
}

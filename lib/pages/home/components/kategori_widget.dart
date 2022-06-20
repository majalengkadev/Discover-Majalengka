import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/models/kategori.dart';
import 'package:discover_majalengka/models/respon_data.dart';
import 'package:discover_majalengka/repositories/main_repo.dart';
import 'package:flutter/material.dart';

import 'kategori_item.dart';

class KategoriWidget extends StatefulWidget {
  const KategoriWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  final repo = MainRepo();
  late Future<ResponData> dataKategori;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Kategori",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          showKategori()
        ],
      ),
    );
  }

  void getData() {
    setState(() {
      dataKategori = repo.getKategori();
    });
  }

  Widget showKategori() {
    return FutureBuilder<ResponData>(
        future: dataKategori,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            final data = snapshot.data!.listData as List<Kategori>;

            return SizedBox(
              height: 50,
              child: ListView.builder(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final kategori = data[index];
                    return KategoriItem(
                      title: kategori.name,
                      image: kategori.image,
                    );
                  }),
            );
          }

          return Container();
        });
  }
}

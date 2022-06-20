import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/models/konten.dart';
import 'package:discover_majalengka/models/respon_data.dart';
import 'package:discover_majalengka/repositories/main_repo.dart';
import 'package:flutter/material.dart';

import 'konten_detail.dart';

class KontenWidget extends StatefulWidget {
  final String slug;
  const KontenWidget({Key? key, required this.slug}) : super(key: key);

  @override
  State<KontenWidget> createState() => _KontenWidgetState();
}

class _KontenWidgetState extends State<KontenWidget> {
  final repo = MainRepo();
  late Future<ResponData> dataKonten;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponData>(
      future: dataKonten,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Loading(),
          );
        }
        if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              TextButton(
                onPressed: () {
                  getData();
                },
                child: const Text("Coba Lagi"),
              )
            ],
          );
        }
        if (snapshot.hasData) {
          final konten = snapshot.data!.data as Konten;
          return KontenDetail(konten: konten);
        }

        return Container();
      },
    );
  }

  void getData() {
    setState(() {
      dataKonten = repo.getDetail(widget.slug);
    });
  }
}

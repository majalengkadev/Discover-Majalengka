import 'dart:math';

import 'package:discover_majalengka/helpers/components/loading.dart';
import 'package:discover_majalengka/models/kategori.dart';
import 'package:discover_majalengka/models/respon_data.dart';
import 'package:discover_majalengka/repositories/main_repo.dart';
import 'package:flutter/material.dart';

class KategoriWidget extends StatefulWidget {
  const KategoriWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KategoriWidget> createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget>
    with TickerProviderStateMixin {
  final repo = MainRepo();
  late Future<ResponData> dataKategori;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    getData();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.animateTo(2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showKategori()],
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
            List<Tab> tabs = [];
            
            for (int i = 0; i < data.length; i++) {
              tabs.add(Tab(
                icon: Icon(Icons.hotel),
               text:  data[i].name,
              ));
            }

            return TabBar(
              padding: EdgeInsets.only(left: 16),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.all(5),
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              onTap: (int index) {
                print('Tab $index is tapped');
              },
              enableFeedback: true,
              controller: _tabController,
              tabs: tabs,
            );
          }

          return Container();
        });
  }
}

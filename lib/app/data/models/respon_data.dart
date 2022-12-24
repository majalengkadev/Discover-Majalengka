class ResponData {
  int? page;
  int? totalPage;
  int? totalData;
  String? pesan;
  dynamic data;
  List<dynamic>? listData;

  ResponData({
    this.page,
    this.totalPage,
    this.totalData,
    this.pesan,
    this.data,
    this.listData,
  });
}

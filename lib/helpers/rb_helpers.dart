import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatMoney(dynamic amount, {bool minus = false}) {
  if (amount is String) amount = int.parse(amount);
  return NumberFormat.currency(locale: "id", symbol: "Rp. ", decimalDigits: 0)
      .format(amount ?? 0);
}

String formatTanggal(String value, {String? format}) {
  final formatter = DateFormat(format ?? "dd/MM/yy HH.mm");
  final date = DateTime.parse(value);
  return formatter.format(date);
}

String formatMoney3(dynamic amount, {bool minus = false}) {
  if (amount is String) amount = int.parse(amount);
  return NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0)
      .format(amount ?? 0);
}

String formatMoney2(dynamic amount, {bool minus = false}) {
  if (amount is String) amount = int.parse(amount);
  return NumberFormat.currency(symbol: "", decimalDigits: 0).format(amount);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Map<String, String> kodeBank() {
  var jenis = <String, String>{};
  jenis['008'] = "Mandiri";
  jenis['002'] = "BRI";
  jenis['014'] = "BCA";
  jenis['009'] = "BNI";
  return jenis;
}

bool cekEmail(String value) {
  if (value.isEmpty) return true;
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp("$pattern");
  if (!regex.hasMatch(value)) return true;
  return false;
}

int randomRange({int min = 1, int max = 4}) {
  final _random = Random();
  final hasil = min + _random.nextInt(max - min);
  return hasil;
}

void printLong(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

dynamic hari({int? day}) {
  final days = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu",
    "Minggu"
  ];

  if (day != null) {
    return days[day - 1];
  } else {
    return days;
  }
}

dynamic bulan({int? ke}) {
  final months = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  if (ke != null) {
    return months[ke - 1];
  } else {
    return months;
  }
}

String inisialText(String v) {
  final texts = v.split(" ");
  String result = texts[0].substring(0, 1);
  if (texts.length > 1) {
    result += texts[1].substring(0, 1);
  }
  return result;
}

log(dynamic val) {
  print("log_rb: $val");
}

String infoExpired(String? tgl) {
  if (tgl == null) {
    return "";
  }

  final date2 = DateTime.now();
  DateTime date = DateTime.parse(tgl);
  int hari = date.difference(date2).inDays;
  int jam = date.difference(date2).inHours;
  int menit = date.difference(date2).inMinutes;
  int detik = date.difference(date2).inSeconds;
  if (hari < 1 && jam < 1 && menit < 1) {
    if (detik < 0) {
      return "0 detik";
    } else {
      return "$detik detik";
    }
  } else if (hari < 1 && jam < 1) {
    return "$menit menit";
  } else if (hari < 1) {
    return "$jam jam";
  } else {
    if (jam < 1) {
      return "$hari hari";
    } else {
      if (jam > 24) {
        jam = jam - 24;
        return "$hari hari $jam jam";
      } else {
        return "$jam jam";
      }
    }
  }
}

String addDay2(String tgl, {int add = 2}) {
  final date2 = DateTime.now(); //DateTime.parse("2021-06-16 06:59:00");
  DateTime date = DateTime.parse(tgl).add(Duration(days: add));
  int hari = date.difference(date2).inDays;
  int jam = date.difference(date2).inHours;
  int menit = date.difference(date2).inMinutes;
  int detik = date.difference(date2).inSeconds;
  if (hari < 1 && jam < 1 && menit < 1) {
    if (detik < 0) {
      return "0 detik";
    } else {
      return "$detik detik";
    }
  } else if (hari < 1 && jam < 1) {
    return "$menit menit";
  } else if (hari < 1) {
    return "$jam jam";
  } else {
    if (jam < 1) {
      return "$hari hari";
    } else {
      if (jam > 24) {
        jam = jam - 24;
        return "$hari hari $jam jam";
      } else {
        return "$jam jam";
      }
    }
  }
}

dialog(BuildContext context, String msg) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Informasi",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  msg,
                  style: const TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text("Tutup"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

Color colorString(String color) {
  color = color.replaceAll("#", "");
  if (color.length == 6) {
    return Color(int.parse("0xFF" + color));
  } else if (color.length == 8) {
    return Color(int.parse("0x" + color));
  } else {
    return Colors.transparent;
  }
}

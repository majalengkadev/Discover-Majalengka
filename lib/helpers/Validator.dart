import 'package:validators/validators.dart';

class Validator {
  static String? handphone(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value.length < 9) return 'Nomor Handphone minimal 9 digit';
    return null;
  }

  static String? required(String? value) {
    if (value!.isEmpty) return 'Harus diisi';
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value.length < 3) return 'Nama minimal 3 digit';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value.length < 6) return 'Password minimal 6 digit';
    return null;
  }

  static String? retypePassword(String? value, String lastPassword) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value != lastPassword) return 'Ulangi Password Tidak Sama';
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) return 'Format Email Salah.';
    return null;
  }

  static String? ktp(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value.length < 16) return 'Nomor KTP minimal 16 digit';
    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (value.length < 3) return 'Kode OTP minimal 3 digit';
    return null;
  }

  static String? numberPositif(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (!isNumeric(value)) {
      return 'Harus Berupa Angka';
    } else if (int.parse(value) <= 0) {
      return 'Harus lebih besar dari 0';
    } else {
      return null;
    }
  }

  static String? number(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (!isNumeric(value)) {
      return 'Harus Berupa Angka';
    } else if (int.parse(value) < 0) {
      return 'Tidak boleh angka negatif';
    } else {
      return null;
    }
  }

  static String? kodePos(String? value) {
    if (value == null || value.isEmpty) return 'Harus diisi';
    if (!isNumeric(value)) {
      return 'Harus Berupa Angka';
    } else if (int.parse(value) < 0) {
      return 'Tidak boleh angka negatif';
    } else if (value.length != 5) {
      return 'Kodepos harus 5 digit';
    } else {
      return null;
    }
  }
}

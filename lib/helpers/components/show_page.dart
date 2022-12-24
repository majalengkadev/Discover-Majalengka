import 'package:flutter/material.dart';

import '../api.dart';
import 'error_layout.dart';
import 'loading_layout.dart';

class ShowPage extends StatelessWidget {
  const ShowPage(
      {Key? key,
      required this.child,
      required this.status,
      this.error,
      this.press})
      : super(key: key);

  final Widget child;
  final StatusKoneksi status;
  final dynamic error;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    if (status == StatusKoneksi.loading) {
      return const LoadingLayout();
    } else if (status == StatusKoneksi.error) {
      return ErrorLayout.error(
        error,
        enableButton: press != null,
        onPressed: press,
      );
    } else {
      return child;
    }
  }
}

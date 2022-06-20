import 'package:flutter/material.dart';

import '../constants.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: taelColor,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}

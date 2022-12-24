import 'package:flutter/material.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation(
            Colors.orange,
          ),
        ),
      ),
    );
  }
}

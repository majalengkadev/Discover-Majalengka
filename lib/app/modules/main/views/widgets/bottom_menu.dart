import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  final int currentTab;
  final ValueChanged<int> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: "Place"),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken_rounded), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff777877),
        currentIndex: currentTab,
        onTap: onSelectTab,
      ),
    );
  }
}

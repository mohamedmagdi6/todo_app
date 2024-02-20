import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onTap, required this.currentIndex});

  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
            ),
            label: 'Done'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archived'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

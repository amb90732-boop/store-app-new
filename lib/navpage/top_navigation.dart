import 'package:flutter/material.dart';

class TopNavBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const TopNavBar({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Widget navItem(String title, int index) {
      bool selected = currentIndex == index;

      return TextButton(
        onPressed: () => onTap(index),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? const Color(0xFF2563EB) : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return AppBar(
      title: const Text(
        "ELBRO",
        style: TextStyle(
          fontSize: 40,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: [
        navItem("Home", 0),
        navItem("About", 2),
        navItem("Store", 1),
        navItem("Contact", 3),
        navItem("Settings", 4),
        const SizedBox(width: 10),
      ],
    );
  }
}

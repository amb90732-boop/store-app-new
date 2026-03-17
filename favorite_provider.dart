import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {

  final Function(int) onTap;
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
       backgroundColor: const Color(0xFFF0F9FF),

      currentIndex: currentIndex > 4 ? currentIndex - 5 : 0,

       selectedItemColor: const Color(0xFF2563EB),
       unselectedItemColor: Colors.black,

      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favorites",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),
      ],

      onTap: (index){

        if(index == 0){
          onTap(5);
        }

        if(index == 1){
          onTap(6);
        }

        if(index == 2){
          onTap(7);
        }

      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:store_app/home_page.dart';
import 'package:store_app/navpage/bottom_navigation.dart';
import 'package:store_app/navpage/top_navigation.dart';
import 'package:store_app/store/about_page.dart';
import 'package:store_app/store/cart_page.dart';
import 'package:store_app/store/contact_page.dart';
import 'package:store_app/store/favorites_page.dart';
import 'package:store_app/store/product_page.dart';
import 'package:store_app/store/profile_page.dart';
import 'package:store_app/store/setting_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int currentIndex = 0;

  final pages = [
    const SettingPage(),
    const ProfilePage(),
    const ContactPage(),
    const AboutPage(),
    const HomePage(),
    const ProductPage(),
    const FavouritaPage(),
    const CartPage(cart: []),
  ];

  void whenChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TopNavBar(onTap: whenChange, currentIndex: currentIndex),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavBar(
        onTap: whenChange,
        currentIndex: currentIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(9),
            child: Text(
              'About Page',
              style: TextStyle(
                fontSize: 40,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          )
        ],
      ),
    );
  }
}
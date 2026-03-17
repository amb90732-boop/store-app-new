import 'package:flutter/material.dart';
import 'package:store_app/store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void shopping(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => StorePage())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Home Page',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRDM12krzQXYJht_rXQqHiBEsdAAJ9I3fGeA&s',
                  width: 400,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // The button to push into store page....
          ElevatedButton(
            onPressed: shopping,
            child: const Text('Go Shopping'),
          ),
        ],
      ),
    );
  }
}

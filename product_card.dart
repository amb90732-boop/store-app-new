import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/navigation_page.dart';
import 'package:store_app/providers/cart_provider.dart';
import 'package:store_app/providers/favorite_provider.dart';
import 'package:store_app/providers/theme_provider.dart';
import 'package:store_app/theme_pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      home: LoginPage(changeTheme: changeTheme),
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,


      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: AppTheme.lightTheme,
    );
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback changeTheme;

  const LoginPage({super.key, required this.changeTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error = "";

  void login() {
    if (!emailController.text.contains("@")) {
      setState(() {
        error = "Email should contain @";
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavigationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //we use stack to be static....
      body: Stack(
        children: [
          Image.network(
            "https://t4.ftcdn.net/jpg/06/91/05/19/360_F_691051962_GFhQPOAXABmf7l706q89b2PFh6FnB1kI.jpg",
            height:
                double.infinity, //to be fill on all screen(واخد مساحة الشاشه)
            fit: BoxFit.cover,
          ),

          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  if (error.isNotEmpty)
                    Text(error, style: TextStyle(color: Colors.red)),

                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'passward'),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(onPressed: login, child: const Text('login')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

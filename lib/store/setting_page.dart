import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/providers/theme_provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    //this is widget collect between the switch(turn on & turn off) and ListTile(item at list has title and icon)....
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: const Text('Settings'),
      ),
      body: SwitchListTile(
        //the text
        title: const Text("Dark Mode"),
        //this is the variable that i used it to access the ThemeProvider
        value: themeProvider.isDarkMode,

        onChanged: (value) {
          themeProvider.toggleTheme(value);
        },
      ),
    );
  }
}

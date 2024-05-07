import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
        title: Text("Settings" , style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),),

        backgroundColor: Theme.of(context).colorScheme.background,
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(left: 25 , top: 10 , right: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Mode" , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
                CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context ,listen: false).isDarkMode,
                    onChanged:
                        (value) =>  Provider.of<ThemeProvider>(
                            context ,listen: false
                        ).toggleTheme()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

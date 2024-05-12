
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/auth/login_or_register.dart';
import 'package:flutterxfirebase/model/restaurant.model.dart';
import 'package:flutterxfirebase/pages/home_page.dart';
import 'package:flutterxfirebase/pages/settings_page.dart';
import 'package:flutterxfirebase/themes/theme_provider.dart';
import "package:provider/provider.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

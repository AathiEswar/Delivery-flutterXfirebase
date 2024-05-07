import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
          title: Text("Home" ,style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,

        ),),
          // backgroundColor: Theme.of(context).colorScheme.background
      ),
      drawer : MyDrawer(),
    );
  }
}

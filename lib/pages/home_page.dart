import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_drawer.dart';
import 'package:flutterxfirebase/components/custom_silver_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //
      //     iconTheme: IconThemeData(color: Theme.of(context).colorScheme.inversePrimary),
      //     title: Text("Home" ,style: TextStyle(
      //     color: Theme.of(context).colorScheme.inversePrimary,
      //
      //   ),),
      //     backgroundColor: Theme.of(context).colorScheme.background
      // ),
      drawer : MyDrawer(),
      body:   NestedScrollView(
        headerSliverBuilder: (context , innerBoxIsScrolled) => [
          MySliverAppBar(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("HELLOOOOOOO")
              ],
            ),
            title: Text("title"),
          )
        ],
        body: Container(color: Colors.blue,),
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_current_location.dart';
import 'package:flutterxfirebase/components/custom_description_box.dart';
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
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
               //current location
                MyCurrentLocation(),

                //description box
                MyDescriptionBox(),
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

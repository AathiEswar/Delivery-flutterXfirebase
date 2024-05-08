import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLoactionSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Your Location"),
              content: TextField(
                decoration: InputDecoration(
                  hintText: "Search Address.."
                ),
              ),
          actions: [
            //cancel Button
              MaterialButton(onPressed: ()=> Navigator.pop(context) ,
              child: Text("Cancel"),),
            //save Button
            //cancel Button
            MaterialButton(onPressed: ()=> Navigator.pop(context) ,
              child: Text("Save"),),
          ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => openLoactionSearchBox(context),
            child: Row(
              children: [
                //address
                Text("No 81/97 , Kolathur , Chennai",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    )),

                Icon(Icons.keyboard_arrow_down_rounded),
                //dropdown
              ],
            ),
          )
        ],
      ),
    );
  }
}

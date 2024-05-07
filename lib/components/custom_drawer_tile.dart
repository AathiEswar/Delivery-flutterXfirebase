import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onTap;

  MyDrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ListTile(
        title: Text(title ,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),),

        leading: Icon(icon ,
          color: Theme.of(context).colorScheme.inversePrimary,),
        onTap: onTap,
      ),
    );
  }
}

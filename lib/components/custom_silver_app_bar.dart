import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

   const MySliverAppBar({super.key , required this.child , required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(onPressed: (){

        }, icon: Icon(Icons.shopping_cart))
      ],
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      backgroundColor: Theme.of(context).colorScheme.background,
      title: Text("Sun Set Dinner"),
      flexibleSpace: FlexibleSpaceBar(
          background: child,
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0 , right: 0 , top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
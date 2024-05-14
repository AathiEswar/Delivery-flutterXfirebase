import 'package:flutter/material.dart';
import 'package:flutterxfirebase/model/food.model.dart';

class MyTabBar extends StatelessWidget {
  TabController tabController;

  MyTabBar({super.key, required this.tabController});


  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category){
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      child: TabBar(
        labelStyle: TextStyle(fontSize: 12), // Adjust font size of selected tab label
        unselectedLabelStyle: TextStyle(fontSize: 12),
        controller: tabController,
        tabs:_buildCategoryTabs(),
      ),
    );
  }
}

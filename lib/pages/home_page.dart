import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_current_location.dart';
import 'package:flutterxfirebase/components/custom_description_box.dart';
import 'package:flutterxfirebase/components/custom_drawer.dart';
import 'package:flutterxfirebase/components/custom_food_tile.dart';
import 'package:flutterxfirebase/components/custom_silver_app_bar.dart';
import 'package:flutterxfirebase/components/custom_tab_bar.dart';
import 'package:flutterxfirebase/model/food.model.dart';
import 'package:flutterxfirebase/model/restaurant.model.dart';
import 'package:flutterxfirebase/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  //sort food based on category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of food in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    //get category menu
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(

          itemCount: categoryMenu.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            //get individual food
            final food = categoryMenu[index];
            return MyFoodTile(
                food: food,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodPage(
                                food: food,
                              )));
                });
          });
    }).toList();
  }

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
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              tabController: _tabController,
            ),
            child: Column(
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
          )
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu)),
        ),
      ),
    );
  }
}

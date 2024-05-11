import 'package:flutter/material.dart';

import 'food.model.dart';

class Restaurant  extends ChangeNotifier{
    //list of food menu
  final List<Food> _menu = [
    Food(name: "Burger",
        description: "Veg Burger",
        imagePath: "assets/food/burger.png",
        price: 299.0,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name:"Extra cheese ", price: 20.0),
          Addon(name:"Extra sauce ", price: 20.0),
          Addon(name:"Extra topings", price: 20.0),
        ]
    ),
    Food(
        name: "Pizza",
        description: "Chicken Pizza",
        imagePath: "assets/food/pizza.png",
        price: 399.0,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name:"Extra cheese ", price: 20.0),
          Addon(name:"Extra sauce ", price: 20.0),
          Addon(name:"Extra topings", price: 20.0),
        ]
    ),
    Food(name: "Tacos",
        description: "Mixed Tacos",
        imagePath: "assets/food/tacos.png",
        price: 299.0,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name:"Extra cheese ", price: 20.0),
          Addon(name:"Extra sauce ", price: 20.0),
          Addon(name:"Extra topings", price: 20.0),
        ]
    ),
    Food(name: "Tacos",
        description: "Mixed Tacos",
        imagePath: "assets/food/tacos.png",
        price: 299.0,
        category: FoodCategory.slides,
        availableAddons: [
          Addon(name:"Extra cheese ", price: 20.0),
          Addon(name:"Extra sauce ", price: 20.0),
          Addon(name:"Extra topings", price: 20.0),
        ]
    ),
    Food(name: "Tacos",
        description: "Mixed Tacos",
        imagePath: "assets/food/tacos.png",
        price: 299.0,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name:"Extra cheese ", price: 20.0),
          Addon(name:"Extra sauce ", price: 20.0),
          Addon(name:"Extra topings", price: 20.0),
        ]
    )

  ];


  //GETTERS
List<Food> get menu => _menu;

//OPERATIONS
//add to cart

//remove from cart

//get total price

//total number of items

//clear cart

//HELPERS
}
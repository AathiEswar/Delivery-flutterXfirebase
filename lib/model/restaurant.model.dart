import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';
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
List<CartItem> get cart => _cart;

//OPERATIONS
//user cart

final List<CartItem> _cart = [];

//add to cart
void addToCart(Food food , List<Addon> selectedAddons){
  CartItem? cartItem= _cart.firstWhereOrNull((item){
    bool isSameFood = item.food == food;

    bool isSameAddons = ListEquality().equals(item.selectedAddons,selectedAddons);

    return isSameAddons && isSameFood;
  });
  // update quantity if exist
  if(cartItem != null){
    cartItem.quantity++;
  }

  //if not exist
  else{
    _cart.add(CartItem(food: food, selectedAddons: selectedAddons));

  }

  notifyListeners();
}
//remove from cart
void removeFromCart (CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);

  if(cartIndex != -1){
    if(_cart[cartIndex].quantity > 1){
      _cart[cartIndex].quantity--;
    }
    else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();
}

//get total price

double getTotalPrice(){
  double total = 0.0;

  for(CartItem cartItem in _cart){
    double itemTotal = cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons){
      itemTotal += addon.price;
    }

    total += itemTotal * cartItem.quantity;
  }

  return total;
}

//total number of items

int getTotalItemCount(){
  int totalCount = 0;

  for(CartItem cartItem in _cart){
    totalCount += cartItem.quantity;
  }
  return totalCount;
}


//clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}
//HELPERS
}
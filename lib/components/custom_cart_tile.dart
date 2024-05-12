import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_quantity_selector.dart';
import 'package:flutterxfirebase/model/cart_item.dart';
import 'package:provider/provider.dart';

import '../model/restaurant.model.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, index) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //food image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            cartItem.food.imagePath,
                            height: 100,
                            width: 100,
                          ),
                        ),

                        const SizedBox(
                          width: 10,
                        ),
                        //name and price
                        Column(
                          children: [
                            // food name
                            Text(cartItem.food.name),

                            // food price
                            Text("₹" + cartItem.food.price.toString() ,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),),
                          ],
                        ),

                        const Spacer(),

                        //counter

                        QuantitySelector(
                            food: cartItem.food,
                            quantity: cartItem.quantity,
                            onIncrement: () {
                              restaurant.addToCart(
                                  cartItem.food, cartItem.selectedAddons);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            })
                      ],
                    ),
                  ),

                  //addons

                  SizedBox(
                    height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10 , right: 10 , bottom: 10),

                      children: cartItem.selectedAddons
                          .map(
                            (addon) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FilterChip(
                                label: Row(
                                  children: [
                                    Text(addon.name),
                                    Text(" (₹"+addon.price.toString() + ")"),
                                  ],
                                ),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: Theme.of(context).colorScheme.primary,
                                  )
                                ),
                                onSelected: (value) {},
                              backgroundColor: Theme.of(context).colorScheme.background,
                                labelStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.inversePrimary,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ));
  }
}

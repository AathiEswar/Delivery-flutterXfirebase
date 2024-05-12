import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_button.dart';
import 'package:flutterxfirebase/components/custom_cart_tile.dart';
import 'package:flutterxfirebase/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../model/restaurant.model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // cart
      final userCart = restaurant.cart;

      //Ui

      return Scaffold(
        appBar: AppBar(
          title: Text("Cart page"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title:
                                Text("Are you sure you want to clear the cart"),
                            actions: [
                              //cancel button
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel")),

                              //yes button
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    restaurant.clearCart();
                                  },
                                  child: Text("Yes"))
                            ],
                          ));
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //list of cart items
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: const Center(child: Text("Cart is empty..")))
                      : Expanded(
                          child: ListView.builder(
                          itemCount: userCart.length,
                          itemBuilder: (context, index) {
                            //get cart
                            final cartItem = userCart[index];

                            //return cart tile UI
                            return MyCartTile(cartItem: cartItem);
                          },
                        )),
                ],
              ),
            ),

            //checkout page
            MyButton(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PaymentPage())),
                text: "Checkout"),

            SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.lock_open_rounded,
            size: 72,
            color: Theme.of(context).colorScheme.inversePrimary,),
            SizedBox(height: 25,),
            
            //message and slogan
            Text("Food Delivery App",
            style: TextStyle(
              fontSize: 16 ,
              color:  Theme.of(context).colorScheme.inversePrimary,
            ),),
            SizedBox(height: 25,),


            //password and textfield
            TextField(),
            //signin button

            //register button
          ],
        ),
      ),
    );
  }
}

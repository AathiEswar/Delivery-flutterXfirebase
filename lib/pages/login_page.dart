import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterxfirebase/components/custom_button.dart';
import 'package:flutterxfirebase/components/custome_text_field.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final  Function()? onTap;
  const LoginPage({super.key,required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //login 
  void login(){
    // Authenticatio for login
    
    
    //navigate to the home page  
    
    Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => HomePage()) ,
    );
  }
  
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
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false),
            SizedBox(height: 10,),

            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),
            SizedBox(height: 10,),


            //signin button

            MyButton(onTap: login,
                text: "SIGN IN"),
            SizedBox(height: 25,),

            //register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member?" ,style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),),
                SizedBox(width: 4,),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register now",style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}

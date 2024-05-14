import 'package:flutter/material.dart';
import 'package:flutterxfirebase/services/auth/auth_services.dart';

import '../components/custom_button.dart';
import '../components/custome_text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key , required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void register() async{
 final _authService = AuthService();

 //check if passwords match

    if(passwordController.text == confirmPasswordController.text){
      try{
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }
      catch(e){
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }
    else{
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Password's dont match"),
      ));
    }
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
            Text("Let's create an account",
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

            MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true),
            SizedBox(height: 25,),


            //sign up button

            MyButton(onTap: (){
              register();
            }, text: "SIGN UP"),
            SizedBox(height: 25,),

            //login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?" ,style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                ),),
                SizedBox(width: 4,),
                GestureDetector(
                  onTap:widget.onTap,

                  child: Text("Login now",style: TextStyle(
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

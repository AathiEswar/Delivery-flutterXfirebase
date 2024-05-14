import 'package:flutter/material.dart';
import 'package:flutterxfirebase/services/auth/auth_services.dart';
import '../pages/settings_page.dart';
import 'custom_drawer_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  void logout(){
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(top : 100.0),
            child: Icon(Icons.lock_open_rounded ,
              size: 40,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary
            ),
          ),


          //home
          MyDrawerTile(
            title: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),


          //settings
          MyDrawerTile(
            title: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage()
                  ),
              );
            },
          ),

          Spacer(),
          //logout
          MyDrawerTile(
            title: 'L O G O U T',
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 20,
          )


        ],
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutterxfirebase/themes/dark_mode.dart";
import "package:flutterxfirebase/themes/light_mode.dart";

class ThemeProvider with ChangeNotifier{
  //private variable instance
  ThemeData _themeData = lightMode;

  //inbuilt getter syntax in flutter
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  //inbuilt setter syntax in flutter
  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData  = darkMode ;
    }
    else {
       themeData = lightMode;
    }
  }

}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";

  ThemeMode modeApp = ThemeMode.dark;

 late final SharedPreferences prefs;




 void init()async{
 final  prefs=await SharedPreferences.getInstance();
  languageCode=prefs.getString('languageCode')??'en';
 bool myMode= prefs.getBool("them")??true;
 if(myMode){
   modeApp=ThemeMode.dark;
 } else{
   modeApp=ThemeMode.light;
 }
 }
  void changeLanguage(String langCode) async {
    languageCode = langCode;
    notifyListeners();
    await prefs.setString("language", languageCode);

  }






  void changeTheme(ThemeMode mode) async {
    modeApp = mode;
    notifyListeners();
    await prefs.setBool("them", modeApp==ThemeMode.dark?true:false);

  }

  String getBackground() {
    if (modeApp == ThemeMode.light) {
      return "assets/images/background.png";


    } else {
      return "assets/images/background_dark.png";
    }
  }
}

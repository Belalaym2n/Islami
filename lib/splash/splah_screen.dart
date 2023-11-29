import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/home.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
 static const String routeName="splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    Timer(Duration(
      seconds: 3
    ), () {
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    });
    return Stack(
      children: [
        Image(image: AssetImage(
          pro.modeApp==ThemeMode.dark?
          "assets/images/dark_back.png":"assets/images/splash_light.png"
        ),fit: BoxFit.cover,)
      ],
    );
  }
}

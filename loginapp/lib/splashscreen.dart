import 'dart:async';
import 'package:flutter/material.dart';
import 'package:loginapp/homepage.dart';
import 'package:loginapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => MyState();
}

class MyState extends State<SplashScreen> {
  // ignore: constant_identifier_names
  static const KEY_LOGIN = "login";

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 110, top: 300),
            width: 150,
            child: Image.asset('assert/insta.jpeg'),
          ),
          const SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }

  void whereToGo() async {
    var sharPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharPref.getBool(KEY_LOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MyHomePage()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const IntroPage()));
        }
      }
    });
  }
}

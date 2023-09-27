import 'package:flutter/material.dart';
import 'package:loginapp/login.dart';
import 'package:loginapp/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text(
          "Welcome To Home Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(MyState.KEY_LOGIN, false);

              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IntroPage(),
                ),
              );
            },
            child: const Text('LOGOUT')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loginapp/homepage.dart';
import 'package:loginapp/splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "instagram",
                  style: TextStyle(
                      fontFamily: "Dancing Script",
                      fontWeight: FontWeight.w700,
                      fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                decoration: InputDecoration(
                  label: const Text('Phone number,username or email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                  onPressed: () async {
                    // if logged in

                    var sharedPref = await SharedPreferences.getInstance();
                    sharedPref.setBool(MyState.KEY_LOGIN,true);

                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                  child: const Text('Log In')),
            ),
          ],
        ),
      ),
    );
  }
}

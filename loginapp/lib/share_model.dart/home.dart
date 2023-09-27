import 'package:flutter/material.dart';
import 'package:loginapp/share_model.dart/details.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
 
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phonenumberTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10.0,),
                    const Icon(Icons.person_pin, size: 100, color: Colors.teal,),
                    const Text('Personal Details', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: nameTextController,
                      decoration:const InputDecoration(
                        hintText: 'Enter Name',
                        prefixIcon: Icon(Icons.person, color: Colors.teal,)
                      ),
                    ),
                    TextFormField(
                      controller: emailTextController,
                      decoration:const InputDecoration(
                          hintText: 'Enter email',
                          prefixIcon: Icon(Icons.work, color: Colors.teal,)
                      ),
                    ),
                    TextFormField(
                      controller: phonenumberTextController,
                      decoration:const InputDecoration(
                          hintText: 'phone number',
                          prefixIcon: Icon(Icons.attach_money, color: Colors.teal,)
                      ),
                    ),
                  
                    const SizedBox(height: 30.0,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            textStyle:const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          // FocusScope.of(context).unfocus();
                          var prefs = await SharedPreferences.getInstance();
                          await prefs.setString('name', nameTextController.text);
                          await prefs.setString('email',emailTextController.text);
                          await prefs.setString('phone', phonenumberTextController.text);
                        

                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return const DetailsScreen();
                          }));
                        },
                        child:const Text('Save')
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
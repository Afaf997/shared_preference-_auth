import 'package:flutter/material.dart';
import 'package:loginapp/share_model.dart/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var name = '';
  var  email = '';
  var phone = '';


  @override
  void initState() {
    getSavedData();
    super.initState();
  }

  getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    name= prefs.getString('name')!;
    email= prefs.getString('email')!;
    phone = prefs.getString('phone')!;
    setState(() {
      name =name;
      email=email;
      phone=phone;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name,  style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(email,style: const TextStyle(fontSize: 20, color: Colors.white)),
                  
              Text(
                phone,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: (){
                      Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>const HomeScreen()) );
                  }, 
                child:const Text("logout",style:TextStyle(
                  color: Colors.black
                ),)),
              ),
            ],
            
          ),
          
        ),
      ),
    );
  }
}

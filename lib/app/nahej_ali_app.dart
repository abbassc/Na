import 'package:flutter/material.dart';
import 'package:nahej_ali/screens/admin_screen.dart';
import 'package:nahej_ali/screens/donor_screen.dart';
import 'package:nahej_ali/screens/home_screen.dart';
import 'package:nahej_ali/screens/volunteer_screen.dart';

class NahejAliApp extends StatefulWidget{
  const NahejAliApp({super.key});
  
  @override
  State<NahejAliApp> createState() {
    return _NahejAliAppState();
  }
}

class _NahejAliAppState extends State<NahejAliApp>{

  String activeScreenName = 'home-screen';

  void changeScreen(String screenName){
    activeScreenName = screenName;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activeScreen = HomeScreen(changeScreen);

    if (activeScreenName == 'admin-screen') {
      activeScreen = AdminScreen(changeScreen);
    }
    
    else if (activeScreenName == 'volunteer-screen') {
      activeScreen = VolunteerScreen(changeScreen);
    }

    else if (activeScreenName == 'donor-screen') {
      activeScreen = DonorScreen(changeScreen);
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Nahej Ali", style: TextStyle(fontWeight: FontWeight.bold),),
        /*actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],*/
      ),
      backgroundColor: Colors.white,
      body: activeScreen
      );
    
  }
}
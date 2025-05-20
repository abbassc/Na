import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  const HomeScreen(this.changeScreen, {super.key,});

  final Function changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              //side: BorderSide(width: 1, color: const Color.fromARGB(255, 27, 136, 134))
              shadowColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Color.fromARGB(255, 204, 136, 1), foregroundColor: Color.fromARGB(255, 27, 136, 134)), 
              onPressed: (){changeScreen('admin-screen');}, label: Text('Admin', style: TextStyle(
                //color: Color.fromARGB(255, 208, 183, 134), 
                fontSize: 20),), icon: Image.asset('assets/images/admin.png', scale: 12,),),
            
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              shadowColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Color.fromARGB(255, 204, 136, 1), foregroundColor: Color.fromARGB(255, 27, 136, 134)), 
              onPressed: (){changeScreen('volunteer-screen');}, label: Text('Volunteer', style: TextStyle(
                //color: Color.fromARGB(255, 208, 183, 134), 
               fontSize: 20),), icon: Image.asset('assets/images/volunteers.png', scale: 12,),),
            
            ElevatedButton.icon(style: ElevatedButton.styleFrom(
              shadowColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Color.fromARGB(255, 204, 136, 1), foregroundColor: Color.fromARGB(255, 27, 136, 134)), 
              onPressed: (){changeScreen('donor-screen');}, label: Text('Donor', style: TextStyle(
                //color: Color.fromARGB(255, 208, 183, 134), 
                fontSize: 20),), icon: Image.asset('assets/images/donorlogo.png', scale: 12,),),
          ],
        ),
      ),
    );
  }

}


/*Scaffold(
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: //Container(
        //decoration: BoxDecoration(
          
        //),
        //child: 
        */
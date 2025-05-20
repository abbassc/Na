import 'package:flutter/material.dart';
import 'package:nahej_ali/data/donations.dart';
import 'package:nahej_ali/widgets/donations_list.dart';

class VolunteerScreen extends StatelessWidget{

  final Function changeScreen;

  const VolunteerScreen(this.changeScreen,{super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 0,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Row(
              spacing: 80,
              children: [
                Text('Tasks: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),          
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Expanded(child: DonationsList(donations)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Available Donations: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Expanded(child: DonationsList(donations)),
                ),
              ],
            ),
          ),

          IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
        ],
      ),
    );
  }

}
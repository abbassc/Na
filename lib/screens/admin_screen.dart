import 'package:flutter/material.dart';
import 'package:nahej_ali/data/donations.dart';
import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donations_list.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class AdminScreen extends StatelessWidget{

  final Function changeScreen;
  
  final Function openAddVolunteerOverlay;

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;
  //final Function addNewVolunteer;
  //final Function deleteVolunteer;

  const AdminScreen( 
  //this.addNewVolunteer, this.deleteVolunteer, 
    {required this.changeScreen, required this.openAddVolunteerOverlay, required this.registeredDonationsList, required this.registeredVolunteersList, super.key}
  );

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
                Text('Volunteers: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                //SizedBox(width: 80,),
                SizedBox(
                    width: 141,
                    height: 28,
                    child: ElevatedButton(style: ElevatedButton.styleFrom(surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), onPressed: (){openAddVolunteerOverlay();}, child: Text('Add Volunteer')),
                  ),
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
                  child: VolunteersList(volunteers),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Donations: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                  child: DonationsList(registeredDonationsList),
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
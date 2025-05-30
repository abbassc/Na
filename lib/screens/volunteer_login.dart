import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class VolunteerLogin extends StatelessWidget{

  const VolunteerLogin(this.changeScreen, {super.key, required this.registeredVolunteersList, required this.registeredDonationsList, required this.openAssignTo, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.deleteVolunteer,});

  final Function changeScreen;
  final List<Volunteer> registeredVolunteersList;
  final List<Donation> registeredDonationsList;

  final Function openAssignTo;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Function deleteVolunteer;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 0,
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text('Login As: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              height: 400,
              child: VolunteersList(volunteersList: registeredVolunteersList, onDeleteVolunteer: (volunteer){deleteVolunteer(volunteer);}, activeScreenName: 'volunteer-login', openAssignTo: openAssignTo, changeScreen: changeScreen, reserve: reserve, isCollected: isCollected, openAddVolunteerOverlay: openAddVolunteerOverlay, deleteVolunteer: deleteVolunteer, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList,),
            ),
          ),

          IconButton.filled(//style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), 
           hoverColor: Theme.of(context).colorScheme.secondary, 
           onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),

        ],
      ),
    );
  }

}



//VolunteerScreen(changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: _deleteVolunteer, openAssignTo: _openAddVolunteerOverlay, reserve: _assignTo, isCollected: _isCollected, volunteer: loggedVolunteer,)
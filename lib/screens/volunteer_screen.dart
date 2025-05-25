import 'package:flutter/material.dart';
import 'package:nahej_ali/data/donations.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donations_list.dart';

class VolunteerScreen extends StatelessWidget{

  final Function openAssignTo;
  final Function changeScreen;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Function deleteVolunteer;
  final Volunteer? volunteerLogged;


  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  const VolunteerScreen(
    {required this.changeScreen, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.registeredDonationsList, required this.registeredVolunteersList, super.key, required this.openAssignTo, required this.reserve, required this.isCollected, this.volunteerLogged}
  );

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 0,
          children: [
      
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Row(
                spacing: 80,
                children: [
                  Text('Tasks: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),          
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
                    child: DonationsList(part: 'tasks', volunteerLogged: volunteerLogged, donationsList: registeredDonationsList, onDeleteDonation: (volunteer){deleteVolunteer(volunteer);}, activeScreenName: 'volunteer-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected,),
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
                    child: DonationsList(part: 'available', donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'volunteer-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged,),
                  ),
                ],
              ),
            ),
      
            IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
          ],
        ),
      ),
    );
  }

}
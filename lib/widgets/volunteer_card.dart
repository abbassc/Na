import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/screens/volunteer_screen.dart';

class VolunteerCard extends StatelessWidget{

  final Volunteer volunteer;
  final String activeScreen;
  final Volunteer? volunteerLogged;

  final Function openAssignTo;
  final Function changeScreen;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Function deleteVolunteer;

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  const VolunteerCard(this.volunteer, {super.key, required this.activeScreen, this.volunteerLogged, required this.openAssignTo, required this.changeScreen, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.registeredDonationsList, required this.registeredVolunteersList,});

  @override
  Widget build(BuildContext context) {

    if(activeScreen == 'volunteer-login'){
      return Card(
        //margin: EdgeInsets.only(),
        //semanticContainer: false,
        shadowColor: Color.fromARGB(255, 208, 183, 134),
        surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        //clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color.fromARGB(204, 27, 136, 134),
      

        child: InkWell(
          splashColor: const Color.fromARGB(108, 155, 39, 176),
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (ctx) => VolunteerScreen(changeScreen: changeScreen, openAddVolunteerOverlay: openAddVolunteerOverlay, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: openAddVolunteerOverlay, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged,)
            //   )
            // );
            changeScreen('volunteer-screen');
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(volunteer.location, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
              Text(volunteer.availability, style: TextStyle(fontWeight: FontWeight.bold,)),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text("\$${donation.amount!.toStringAsFixed(2)}"),
                  Spacer(),
                  Row(
                    children: [
                      //Icon(categoryIcon[expense.category]),
                      SizedBox(width: 8),
                      //Text(expense.formattedDate)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        ),
      );
    }

    return Card(
      //margin: EdgeInsets.only(),
      //semanticContainer: false,
      shadowColor: Color.fromARGB(255, 208, 183, 134),
      surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
      //clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromARGB(204, 27, 136, 134),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(volunteer.location, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text(volunteer.availability, style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text("\$${donation.amount!.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    //Icon(categoryIcon[expense.category]),
                    SizedBox(width: 8),
                    //Text(expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
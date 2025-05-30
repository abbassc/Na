import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/screens/volunteer_screen.dart';

class VolunteerCard extends StatelessWidget{

  final Volunteer volunteer;
  final String activeScreen;
  //final Volunteer? volunteerLogged;
  final Donation? donationToAssig;

  final Function openAssignTo;
  final Function changeScreen;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Function deleteVolunteer;

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  const VolunteerCard(this.volunteer, {super.key, required this.activeScreen, required this.openAssignTo, required this.changeScreen, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.registeredDonationsList, required this.registeredVolunteersList, this.donationToAssig, });

  @override
  Widget build(BuildContext context) {

    if(activeScreen == 'volunteer-login'){
      return Card(
        //margin: EdgeInsets.only(),
        //semanticContainer: false,
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        //clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.primary,
        
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.secondary,
        //const Color.fromARGB(255, 208, 183, 134),
        //const Color.fromARGB(255, 27, 136, 134),
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (ctx) => VolunteerScreen(changeScreen: changeScreen, openAddVolunteerOverlay: openAddVolunteerOverlay, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: openAddVolunteerOverlay, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged,)
            //   )
            // );
            changeScreen('volunteer-screen',volunteer: volunteer);
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(volunteer.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
              //Text('id: ${volunteer.id}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
              //Text('phone: ${volunteer.phone}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
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

    if(activeScreen == 'assign-to'){
      return Card(
        //margin: EdgeInsets.only(),
        //semanticContainer: false,
        shadowColor: Theme.of(context).primaryColor,
        surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
        //clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Theme.of(context).colorScheme.secondary,
      

        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
        //const Color.fromARGB(255, 208, 183, 134),
        //const Color.fromARGB(255, 27, 136, 134),
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (ctx) => VolunteerScreen(changeScreen: changeScreen, openAddVolunteerOverlay: openAddVolunteerOverlay, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: openAddVolunteerOverlay, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged,)
            //   )
            // );
            //changeScreen('volunteer-screen', volunteer: volunteer);
            reserve(donationToAssig, volunteer,);
            Navigator.pop(context);
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(volunteer.name, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 18)),
              Text('Location: ${volunteer.location}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
              Text('Availabilty: ${volunteer.availability}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),

              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Spacer(),
                  Row(
                    children: [
                      
                      SizedBox(width: 8),
                      
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
      shadowColor: Theme.of(context).colorScheme.secondary,
      surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
      //clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Theme.of(context).colorScheme.primary,//Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(volunteer.name, style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold,fontSize: 16)),
            Text(volunteer.location, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text('Availability: ${volunteer.availability}', style: TextStyle(fontWeight: FontWeight.bold,)),
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
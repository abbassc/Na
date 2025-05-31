import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donations_list.dart';

class VolunteerScreen extends StatelessWidget{

  final String activePart;

  final Function openDonationDetails;
  final Function openVolunteerDetails;
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
    {required this.changeScreen, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.registeredDonationsList, required this.registeredVolunteersList, super.key, required this.openAssignTo, required this.reserve, required this.isCollected, this.volunteerLogged, required this.activePart, required this.openDonationDetails, required this.openVolunteerDetails}
  );

  @override
  Widget build(BuildContext context) {

    if(activePart == 'Tasks'){
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 0,
              children: [
          
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 80,
                    children: [
                      Text('Tasks: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),          
                    ],
                  ),
                ),
                        
                Expanded(child: DonationsList(part: 'tasks', volunteerLogged: volunteerLogged, donationsList: registeredDonationsList, onDeleteDonation: (volunteer){deleteVolunteer(volunteer);}, activeScreenName: 'volunteer-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected, openDonationDetails: openDonationDetails, openVolunteerDetails: openVolunteerDetails,)),

              ]
            ),

          IconButton.filled(//style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), 
                  hoverColor: Theme.of(context).colorScheme.secondary,  
                onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
        ]
      );
    }

    if(activePart == 'Available'){
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
            Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 0,
            children: [
          
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Available Donations: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                      
                    Expanded(child: DonationsList(part: 'available', donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'volunteer-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged, openDonationDetails: openDonationDetails, openVolunteerDetails: openVolunteerDetails,)),
          
            ]
          ),

        IconButton.filled(//style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), 
                      hoverColor: Theme.of(context).colorScheme.secondary, 
                      onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),
                      ),

        ]
      );
    }

    if(activePart == 'Archive'){
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
            Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 0,
            children: [
          
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Archive: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
                
              Expanded(child: DonationsList(part: 'archive', donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'volunteer-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected, volunteerLogged: volunteerLogged, openDonationDetails: openDonationDetails, openVolunteerDetails: openVolunteerDetails,)),
          
            ]
          ),

          IconButton.filled(
            //style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), 
            hoverColor: Theme.of(context).colorScheme.secondary, 
            onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),
            ),

        ],
      );
    }
    return Text("Enter Partttt");
  }

}










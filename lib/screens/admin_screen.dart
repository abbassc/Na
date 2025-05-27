import 'package:flutter/material.dart';
import 'package:nahej_ali/data/donations.dart';
import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donations_list.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class AdminScreen extends StatelessWidget{

  final Function openAssignTo;
  final Function reserve;
  final Function isCollected;

  final Function changeScreen;
  
  final VoidCallback openAddVolunteerOverlay;
  //final Function openAddVolunteerOverlay;

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;
  //final Function addNewVolunteer;
  final Function deleteVolunteer;
  final Function deleteDonation;


  const AdminScreen( 
  // this.deleteVolunteer, 
    {required this.changeScreen, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.deleteDonation, required this.registeredDonationsList, required this.registeredVolunteersList, super.key, required this.openAssignTo, required this.reserve, required this.isCollected}
  );

  @override
  Widget build(BuildContext context) {
    //var activeScreenName= 'admin-screen';
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
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
                          child: ElevatedButton(style: ElevatedButton.styleFrom(surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), onPressed: openAddVolunteerOverlay, child: Text('Add Volunteer')),
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
                        child: VolunteersList(volunteersList: registeredVolunteersList, onDeleteVolunteer: (volunteer){deleteVolunteer(volunteer);}, activeScreenName: 'admin-screen', openAssignTo: openAssignTo, changeScreen: changeScreen, reserve: reserve, isCollected: isCollected, openAddVolunteerOverlay: openAddVolunteerOverlay, deleteVolunteer: deleteVolunteer, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList,),
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
                        child: DonationsList(part: 'pending', donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'admin-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected,),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Collected Donations: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
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
                        child: DonationsList(part: 'collected', donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'admin-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
        ]
      ),
    );
  }

}
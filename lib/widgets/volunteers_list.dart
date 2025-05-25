import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/volunteer_card.dart';


class VolunteersList extends StatelessWidget{

  final List<Volunteer> volunteersList;
  final String activeScreenName;

  final Function openAssignTo;
  final Function changeScreen;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Function deleteVolunteer;
  final Volunteer? volunteerLogged;

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  final void Function(Volunteer) onDeleteVolunteer;

  const VolunteersList({required this.volunteersList, required this.onDeleteVolunteer, super.key, required this.activeScreenName, required this.openAssignTo, required this.changeScreen, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.deleteVolunteer, required this.registeredDonationsList, required this.registeredVolunteersList, this.volunteerLogged,});


  @override
  Widget build(BuildContext context) {

    if(activeScreenName == 'admin-screen'){
      return ListView.builder(
        itemCount: volunteersList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => //VolunteerCard(volunteersList[index])
        Dismissible(
          background: Container(
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(color: const Color.fromARGB(255, 173, 25, 15), borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 25,
            ),
          ),
          key: ValueKey(volunteersList[index]),
          child: ClipRRect(clipBehavior: Clip.antiAlias, borderRadius: BorderRadius.circular(20), child: VolunteerCard(volunteersList[index], activeScreen: activeScreenName, openAssignTo: openAssignTo, changeScreen: changeScreen, reserve: reserve, isCollected: isCollected, openAddVolunteerOverlay: openAddVolunteerOverlay, deleteVolunteer: deleteVolunteer, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList,)),
          onDismissed: (direction) {
            onDeleteVolunteer(volunteersList[index]);
          },
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('Yes'),
                  )
                ],
                title: Text('Delete Volunteer'),
                content: Text('Are you sure you want to delete this volunteer?'),
              ),
            );
          },
        ),
      );
    }

    return ListView.builder(
        itemCount: volunteersList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => //VolunteerCard(volunteersList[index])
          ClipRRect(clipBehavior: Clip.antiAlias, borderRadius: BorderRadius.circular(20), child: VolunteerCard(volunteersList[index], activeScreen: activeScreenName, volunteerLogged: volunteerLogged, openAssignTo: openAssignTo, changeScreen: changeScreen, reserve: reserve, isCollected: isCollected, openAddVolunteerOverlay: openAddVolunteerOverlay, deleteVolunteer: deleteVolunteer, registeredDonationsList: registeredDonationsList, registeredVolunteersList: registeredVolunteersList,)),
      );
  }
}
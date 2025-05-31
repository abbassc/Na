import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class AssignTo extends StatefulWidget{

  final List<Volunteer> registeredVolunteersList;
  final List<Donation> registeredDonationsList;
  final Function deleteVolunteer;
  final Function openAssignTo;
  final Function changeScreen;
  final Function reserve;
  final Function isCollected;
  final Function openAddVolunteerOverlay;
  final Donation donationToAssign;
  final Function openVolunteerDetails;

  const AssignTo(void Function(Donation donation, Volunteer volunteer) assignTo, {super.key, required this.registeredVolunteersList, required this.deleteVolunteer, required this.openAssignTo, required this.changeScreen, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.registeredDonationsList, required this.donationToAssign, required this.openVolunteerDetails});

  @override
  State<StatefulWidget> createState() {
    return _AssignToState();
  }
}

class _AssignToState extends State<AssignTo> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius:  BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)), color: Theme.of(context).scaffoldBackgroundColor,),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 300,
            height: 600,
            child: VolunteersList(donationToAssign: widget.donationToAssign, volunteersList: widget.registeredVolunteersList, onDeleteVolunteer: (volunteer){widget.deleteVolunteer(volunteer);}, activeScreenName: 'assign-to', openAssignTo: widget.openAssignTo, changeScreen: widget.changeScreen, reserve: widget.reserve, isCollected: widget.isCollected, openAddVolunteerOverlay: widget.openAddVolunteerOverlay, deleteVolunteer: widget.deleteVolunteer, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, openVolunteerDetails: widget.openVolunteerDetails,),
          ),
        ),
      );
  }
}

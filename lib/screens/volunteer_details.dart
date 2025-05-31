import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donations_list.dart';

class VolunteerDetails extends StatefulWidget {
  const VolunteerDetails({
    super.key,
    required this.volunteer, required this.donationsList, required this.activeScreenName, required this.isCollected, required this.reserve, required this.openAssignTo, required this.onDeleteDonation, required this.openDonationDetails, required this.openVolunteerDetails,
  });

  final Volunteer volunteer;

  final List<Donation> donationsList;

  final String activeScreenName;

  final Function isCollected;
  final Function reserve;
  final Function openAssignTo;
  final void Function(Donation) onDeleteDonation;
  final Function openDonationDetails;
  final Function openVolunteerDetails;

  // final Function(int) selectDetailsPart;
  // final int selectedDetailsIndex;

   
  @override
  State<StatefulWidget> createState() {
    return _VolunteerDetailsState();
  }
}

class _VolunteerDetailsState extends State<VolunteerDetails> {
  
  int _selectedDetailsIndex = 0;

  void _selectDetailsPart(int index) {
    setState(() {
      _selectedDetailsIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget toReturn = SizedBox(width: 0, height: 0,);
    if(_selectedDetailsIndex == 0){
      toReturn = Container(
        
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name:                ${widget.volunteer.name}'),
              Text('Phone:               ${widget.volunteer.phone}'),
              Text('Location:          ${widget.volunteer.location}'),
              Text('Availability:     ${widget.volunteer.availability}'),
            ],
          ),
        ),
      );
    }
    if(_selectedDetailsIndex == 1){
      toReturn = Expanded(child: DonationsList(part: 'details-assigned', volunteerLogged: widget.volunteer, donationsList: widget.donationsList, onDeleteDonation: widget.onDeleteDonation, activeScreenName: widget.activeScreenName, openAssignTo: widget.openAssignTo, reserve: widget.reserve, isCollected: widget.isCollected, openDonationDetails: widget.openDonationDetails, openVolunteerDetails: widget.openVolunteerDetails),);
    }
    if(_selectedDetailsIndex == 2){
      toReturn = Expanded(child: DonationsList(part: 'details-completed', volunteerLogged: widget.volunteer, donationsList: widget.donationsList, onDeleteDonation: widget.onDeleteDonation, activeScreenName: widget.activeScreenName, openAssignTo: widget.openAssignTo, reserve: widget.reserve, isCollected: widget.isCollected, openDonationDetails: widget.openDonationDetails, openVolunteerDetails: widget.openVolunteerDetails),);
    }
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectDetailsPart,
          currentIndex: _selectedDetailsIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Details'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Assigned'), 
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed')
          ]
        ),

      appBar: AppBar(
        title: Text(widget.volunteer.name),
      ),
      body: Center(child: toReturn),
    );
  }
 
}

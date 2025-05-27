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

  const AssignTo(void Function(Donation donation, Volunteer volunteer) assignTo, {super.key, required this.registeredVolunteersList, required this.deleteVolunteer, required this.openAssignTo, required this.changeScreen, required this.reserve, required this.isCollected, required this.openAddVolunteerOverlay, required this.registeredDonationsList, required this.donationToAssign});

  @override
  State<StatefulWidget> createState() {
    return _AssignToState();
  }
}

class _AssignToState extends State<AssignTo> {
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: 600,
          child: VolunteersList(donationToAssign: widget.donationToAssign, volunteersList: widget.registeredVolunteersList, onDeleteVolunteer: (volunteer){widget.deleteVolunteer(volunteer);}, activeScreenName: 'assign-to', openAssignTo: widget.openAssignTo, changeScreen: widget.changeScreen, reserve: widget.reserve, isCollected: widget.isCollected, openAddVolunteerOverlay: widget.openAddVolunteerOverlay, deleteVolunteer: widget.deleteVolunteer, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList,),
        ),
      );
  }
}




/*class _NewVolunteerState extends State<NewVolunteer> {
  // String volunteerNamee = '';

  // void _saveVolunteerName(String input) {
  //   volunteerNamee = input;
  // }

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  final _availabilityController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _availabilityController.dispose();
    super.dispose();
  }


  void _submitVolunteerForm() {
    var enteredPhone = int.tryParse(_phoneController.text);
    int min = 3000000;
    int max = 96181999999;
    var phoneIsInvalid = enteredPhone == null || enteredPhone/*.bitLength*/ < min/*.bitLength*/ || enteredPhone/*.bitLength*/ > max/*.bitLength*/;
    if (_nameController.text.trim().isEmpty ||
        phoneIsInvalid || 
        _locationController.text.trim().isEmpty || 
        _availabilityController.text.trim().isEmpty
        ) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
              'Please make sure you eneter a valid phone, name, location and availability'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Close'),
            )
          ],
        ),
      );
      return;
    }
    

    // continue your code here
    Volunteer newVolunteer = Volunteer.named(
        phone: enteredPhone,
        name: _nameController.text,
        location: _locationController.text,
        availability: _availabilityController.text,
        );
    widget.addNewVolunteer(newVolunteer);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          TextField(
            //onChanged: _saveVolunteerName,
            controller: _nameController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Volunteer name"),
            ),
          ),
          
          TextField(
            //onChanged: _saveVolunteerName,
            controller: _phoneController,
            keyboardType: TextInputType.number,
            maxLength: 13,
            decoration: InputDecoration(
              label: Text("Phone"),
            ),
            inputFormatters: <TextInputFormatter>[
             FilteringTextInputFormatter.digitsOnly
            ]
          ),

          TextField(
            //onChanged: _saveVolunteerName,
            controller: _locationController,
            maxLength: 200,
            decoration: InputDecoration(
              label: Text("Location"),
            ),
          ),

          TextField(
            //onChanged: _saveVolunteerName,
            controller: _availabilityController,
            maxLength: 200,
            decoration: InputDecoration(
              label: Text("Availability"),
            ),
          ),

          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //DropdownButton(
                //  value: _selectedCategory,
                  //items: List.empty(),
              //),

              Spacer(),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),

              ElevatedButton(
                onPressed: _submitVolunteerForm,
                child: Text('Save Volunteer'),
              ),

            ],
          )
        ],
      ),
    );
  }
}
*/
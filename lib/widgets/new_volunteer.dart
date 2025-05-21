import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nahej_ali/models/volunteer.dart';

class NewVolunteer extends StatefulWidget {
  const NewVolunteer(this.addNewVolunteer, {super.key});

  final void Function(Volunteer) addNewVolunteer;

  @override
  State<NewVolunteer> createState() => _NewVolunteerState();
}

class _NewVolunteerState extends State<NewVolunteer> {
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
    int min = 70000000;
    int max = 96181999999;
    var phoneIsInvalid = enteredPhone == null || enteredPhone.bitLength < min.bitLength || enteredPhone.bitLength > max.bitLength;
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
            maxLength: 13,
            decoration: InputDecoration(
              label: Text("Phone"),
            ),
          ),

          // TextField(
          //     decoration: InputDecoration(labelText: "Enter your number"),
          //     keyboardType: TextInputType.number,
          //     inputFormatters: <TextInputFormatter>[
          //       FilteringTextInputFormatter.digitsOnly
          //     ], // Only numbers can be entered
          //   ),

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

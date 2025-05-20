import 'package:flutter/material.dart';
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

  //////final _nameController = TextEditingController();
  
  @override
  void dispose() {
    //////_titleController.dispose();
    ///////_amountController.dispose();
    super.dispose();
  }


  void _submitVolunteerForm() {
    //var enteredAmount = double.tryParse(_amountController.text);
    //var amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    /*    ///////////////if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
              'Please make sure you eneter a valid title, amount, and date'),
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
    */

    // continue your code here
    Volunteer newVolunteer = Volunteer.named(
        //////name: _nameController.text,
        ///////location: _locationController
        name: '',
        location: '',
        availability: '',
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
            //controller: _nameController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Volunteer name"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  ////////////////
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                     'blablaaaaaaaaaaaaaaaaaaaaaaa',
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ],
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

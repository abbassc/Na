import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:intl/intl.dart';

class NewDonation extends StatefulWidget {
  const NewDonation(this.addNewDonation, {super.key, /*required this.itNeedsCar*/});

  final void Function(Donation) addNewDonation;
  //final void Function(Donation donation, bool value) itNeedsCar;

  @override
  State<NewDonation> createState() => _NewDonationState();
}

class _NewDonationState extends State<NewDonation> {
  // String donationTitle = '';

  // void _saveDonationTitle(String input) {
  //   donationTitle = input;
  // }

  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _timeController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.Money;
  bool needsCar = false;
  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _timeController.dispose();
    _amountController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    var now = DateTime.now();
    var lastDate = DateTime(now.year + 1,  now.month, now.day);
    var firstDate = DateTime(now.year, now.month, now.day + 1);
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitDonationForm() {
    var enteredPhone = int.tryParse(_phoneController.text);
    int min = 3000000;
    int max = 96181999999;
    var phoneIsInvalid = enteredPhone == null || enteredPhone/*.bitLength*/ < min/*.bitLength*/ || enteredPhone/*.bitLength*/ > max/*.bitLength*/;
    var enteredAmount = double.tryParse(_amountController.text);
    var amountIsInvalid = false;
    if(enteredAmount != null){
      amountIsInvalid =  enteredAmount <= 0;
      }
    //enteredAmount ??= 0;
    //needsCar ??= false;
    if (_titleController.text.trim().isEmpty ||
        _locationController.text.trim().isEmpty ||
        _timeController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null ||
        phoneIsInvalid
        ) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
              'Please make sure you eneter a valid title, location, time, date and amount'),
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
    enteredAmount ??= 0;
    Donation newDonation = Donation.named(
        title: _titleController.text,
        location: _locationController.text,
        time: _timeController.text,
        date: _selectedDate!,
        category: _selectedCategory,
        amount: enteredAmount,
        donorPhone: enteredPhone,
        needsCar: needsCar,
        );
    widget.addNewDonation(newDonation);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveDonationTitle,
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Donation Title"),
            ),
          ),
          TextField(
            //onChanged: _saveDonationLocation,
            controller: _phoneController,
            maxLength: 13,
            decoration: InputDecoration(
              label: Text("Phone Number"),
            ),
          ),
          TextField(
            //onChanged: _saveDonationLocation,
            controller: _locationController,
            maxLength: 200,
            decoration: InputDecoration(
              label: Text("Location"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$ ',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Selected'
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          TextField(
            //onChanged: _saveDonationTime,
            controller: _timeController,
            maxLength: 10,
            decoration: InputDecoration(
              label: Text("Time"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase())),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitDonationForm,
                child: Text('Save Donation'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(title: Text('Donation needs car?'), 
                  value: needsCar, 
                  onChanged: (ischecked){
                    setState(
                      () {
                        needsCar = ischecked ?? false;
                      }
                    );
                  }
                )
              ),
            ],
          ),

          // Column(
          //   children: [
          //     Text('Needs Car?'),
          //      RadioListTile<bool>(
          //       title: Text('yes'),
          //       value: true,
          //       groupValue: needsCar,
          //       onChanged: (value) {
          //         setState(() {
          //           needsCar = value!;
          //         });
          //       },
          //     ),
          //     RadioListTile<bool>(
          //       title: Text('no'),
          //       value: false,
          //       groupValue: needsCar,
          //       onChanged: (value) {
          //         setState(() {
          //           needsCar = value!;
          //         });
          //       },
          //     ),
          //   ]
          // ),
          //RadioListTile(value: needsCar, groupValue: [true, false], onChanged: onChanged)
        ],
      ),
    );
  }
}


// String errorMessage = '';
// if (_titleController.text.trim().isEmpty) errorMessage += '• Title is required.\n';
// if (_locationController.text.trim().isEmpty) errorMessage += '• Location is required.\n';
// // ...
// if (errorMessage.isNotEmpty) {
//   showDialog(
//     context: context,
//     builder: (ctx) => AlertDialog(
//       title: Text('Invalid Input'),
//       content: Text(errorMessage),
//       actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: Text('Close'))],
//     ),
//   );
//   return;
// }

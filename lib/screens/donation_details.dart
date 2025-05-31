import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';

class DonationDetails extends StatelessWidget {
  const DonationDetails({
    super.key,
    required this.donation,
  });

  final Donation donation;

  @override
  Widget build(BuildContext context) {

    Widget assigned = SizedBox(width: 0, height: 0,);
    Widget collected = SizedBox(width: 0, height: 0,);
    Widget car = SizedBox(width: 0, height: 0,);
    Widget amount = SizedBox(width: 0, height: 0,);


    if(donation.isAssigned){
      assigned = Text('Volunteer Assigned: ${donation.volunteerAssigned!.name}');
      if(donation.isCollected){
        collected = Text('Collected ✅');
      }
      else{
        collected = Text('Pending 🟧');
      }
    }
    else{
      assigned = Text('Not Assigned ⚠️');
    }

    if(donation.needsCar){
      car = Text('Donation Needs Car 🚗');
    }
    if(donation.amount != null && donation.amount != 0){
      amount = Text('Amount: 💲${donation.amount}');
    }

    

    return Scaffold(
      appBar: AppBar(
        title: Text(donation.title),
      ),
      body: Center(
          child: Container(
        
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
                  Text('Title:                  ${donation.title}'),
                  Text('Location:          ${donation.location}'),
                  Text('Date:                   ${donation.formattedDate}'),
                  Text('Time:                  ${donation.time}\n'),
                  Text('${donation.category}'),
                  amount,
                  car,
                  assigned,
                  collected,                  
                ],
              ),
            ),
          ),
        ),
    );
  }
}

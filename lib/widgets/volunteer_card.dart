import 'package:flutter/material.dart';
import 'package:nahej_ali/models/volunteer.dart';

class VolunteerCard extends StatelessWidget{

  final Volunteer volunteer;

  const VolunteerCard(this.volunteer, {super.key,});

  @override
  Widget build(BuildContext context) {

    return Card(
      //margin: EdgeInsets.only(),
      //semanticContainer: false,
      shadowColor: Color.fromARGB(255, 208, 183, 134),
      surfaceTintColor: Color.fromARGB(255, 255, 255, 255),
      //clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromARGB(204, 27, 136, 134),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(volunteer.location, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
            Text(volunteer.availability, style: TextStyle(fontWeight: FontWeight.bold,)),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Text("\$${donation.amount!.toStringAsFixed(2)}"),
                Spacer(),
                Row(
                  children: [
                    //Icon(categoryIcon[expense.category]),
                    SizedBox(width: 8),
                    //Text(expense.formattedDate)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
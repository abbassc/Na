import 'package:flutter/material.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/volunteer_card.dart';


class VolunteersList extends StatelessWidget{

  final List<Volunteer> volunteersList;

  const VolunteersList(this.volunteersList, {super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: volunteersList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => VolunteerCard(volunteersList[index])
    );
  }
}
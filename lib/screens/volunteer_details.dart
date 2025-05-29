import 'package:flutter/material.dart';
import 'package:nahej_ali/models/volunteer.dart';

class VolunteerDetails extends StatelessWidget {
  const VolunteerDetails({
    super.key,
    required this.volunteer,
  });

  final Volunteer volunteer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(volunteer.name),
      ),
      body: Column(),
    );
  }
}

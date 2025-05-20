import 'package:flutter/material.dart';
import 'package:nahej_ali/app/nahej_ali_app.dart';
import 'package:nahej_ali/data/donations.dart';
import 'package:nahej_ali/data/volunteers.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NahejAliApp(registeredDonationsList: donations, registeredVolunteersList: volunteers,),
      debugShowCheckedModeBanner: false,
    );
  }
}

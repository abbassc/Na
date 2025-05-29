import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nahej_ali/app/nahej_ali_app.dart';
//import 'package:nahej_ali/data/donations.dart';
//import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
// install and import sqflite_common_ffi if you are running a windows application
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // a line required before any async code in main
  WidgetsFlutterBinding.ensureInitialized();
  // Change the database factory if you are running a windows application
  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  // Load the donations and volunteers from the database
  List<Volunteer> volunteersList = await loadVolunteers();
  List<Donation> donationsList = await loadDonations();
  // pass the loaded donations and volunteers to MainApp, which will pass them to NahejAliApp
  runApp(MainApp(registeredDonations: donationsList, registeredVolunteers: volunteersList,));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.registeredDonations, required this.registeredVolunteers, super.key});

  final List<Donation> registeredDonations;
  final List<Volunteer> registeredVolunteers;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface),
        //colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(a, r, g, b), brightness: ,),
        //floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: colorScheme.tertiary, foregroundColor: colorScheme.onTertiary,),
        textTheme: TextTheme(
          displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
          //titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
          //bodyMedium: GoogleFonts.merriweather(),
          //displaySmall: GoogleFonts.pacifico(),
          ), 
        ),
      
      //home: AdminTabsScreen(registeredDonationsList: registeredDonations, registeredVolunteersList: registeredVolunteers),


      home: NahejAliApp(registeredDonationsList: registeredDonations, registeredVolunteersList: registeredVolunteers),
      debugShowCheckedModeBanner: false,
    );
  }
}

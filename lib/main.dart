import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nahej_ali/app/nahej_ali_app.dart';
//import 'package:nahej_ali/data/donations.dart';
//import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/themes/nahej_ali_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  // Load the donations and volunteers from the database
  List<Volunteer> volunteersList = await loadVolunteers();
  List<Donation> donationsList = await loadDonations();
  // pass the loaded donations and volunteers to MainApp, which will pass them to NahejAliApp
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child:  MainApp(
                registeredDonations: donationsList, registeredVolunteers: volunteersList,
              ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({required this.registeredDonations, required this.registeredVolunteers, super.key});

  final List<Donation> registeredDonations;
  final List<Volunteer> registeredVolunteers;
  
  @override
  Widget build(BuildContext context) {

    final themeManager = Provider.of<ThemeManager>(context);

    return Consumer<ThemeManager>(
      builder: ( context, themeManager,child) {  
      return MaterialApp(
        
        theme: themeManager.lightTheme,
        darkTheme: themeManager.darkTheme,
        themeMode: themeManager.currentMode,
        // theme: NahejAliThemeConfig.lightOriginalTheme,
        // darkTheme: NahejAliThemeConfig.darkOriginalTheme,
        // themeMode: ThemeMode.system,
      
        //highContrastTheme: ThemeData(),
        //highContrastDarkTheme: ThemeData(),        
       
        home: NahejAliApp(registeredDonationsList: registeredDonations, registeredVolunteersList: registeredVolunteers),
        debugShowCheckedModeBanner: false,
      );
      }
    );
  }
}








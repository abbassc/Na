import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/screens/admin_screen.dart';
import 'package:nahej_ali/screens/donor_screen.dart';
import 'package:nahej_ali/screens/home_screen.dart';
import 'package:nahej_ali/screens/volunteer_login.dart';
import 'package:nahej_ali/screens/volunteer_screen.dart';
import 'package:nahej_ali/widgets/assign_to.dart';
import 'package:nahej_ali/widgets/new_donation.dart';
import 'package:nahej_ali/widgets/new_volunteer.dart';

class NahejAliApp extends StatefulWidget{
  const NahejAliApp({super.key, required this.registeredDonationsList, required this.registeredVolunteersList,});

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  @override
  State<NahejAliApp> createState() {
    return _NahejAliAppState();
  }
}

class _NahejAliAppState extends State<NahejAliApp>{

  late Volunteer loggedVolunteer;

  String activeScreenName = 'home-screen';

  void changeScreen(String screenName, {Volunteer? volunteer}){
    activeScreenName = screenName;
    if (screenName == 'volunteer-screen'){
      loggedVolunteer = volunteer!;
    }
    setState(() {
      
    });
  }

  void _openAssignToOverlay() {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AssignTo(_assignTo),
      );
    //});
  }

  void _assignTo(Donation donation, Volunteer volunteer) async {
    setState(() {
      donation.volunteerAssigned = volunteer;
      donation.assign();
    });
  }

  void _isCollected(Donation donation) async {
    setState(() {
      donation.collect();
    });
  }




  void _openAddDonationOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewDonation(_addNewDonation),
    );
  }

  void _addNewDonation(Donation donation) async {
    setState(() {
      // now, when you want to use registeredDonationList in the State class, you use the widget varaible
      widget.registeredDonationsList.add(donation);
    });
    // insert the new donation to the database
    insertDonation(donation);
  }

  void _deleteDonation(Donation donation) {
    int index = widget.registeredDonationsList.indexOf(donation);
    setState(() {
      widget.registeredDonationsList.remove(donation);
      // delete the donation from the database
      deleteDonation(donation);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.registeredDonationsList.insert(index, donation);
              // insret the donation again if the user revert the action
              insertDonation(donation);
            });
          },
        ),
      ),
    );
  }



  void _openAddVolunteerOverlay() {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewVolunteer(_addNewVolunteer),
      );
    //});
  }

  void _addNewVolunteer(Volunteer volunteer) async {
    setState(() {
      // now, when you want to use registeredDonationList in the State class, you use the widget varaible
      widget.registeredVolunteersList.add(volunteer);
    });
    // insert the new donation to the database
    insertVolunteer(volunteer);
  }

  void _deleteVolunteer(Volunteer volunteer) {
    int index = widget.registeredVolunteersList.indexOf(volunteer);
    setState(() {
      widget.registeredVolunteersList.remove(volunteer);
      // delete the volunteer from the database
      deleteVolunteer(volunteer);
    });
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Volunteer Deleted"),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                widget.registeredVolunteersList.insert(index, volunteer);
                // insret the volunteer again if the user revert the action
                insertVolunteer(volunteer);
              });
            },
          ),
        ),
      );
    //});
  }







  @override
  Widget build(BuildContext context) {

    Widget activeScreen = HomeScreen(changeScreen);

    if (activeScreenName == 'admin-screen') {
      activeScreen = AdminScreen(changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteDonation: _deleteDonation, deleteVolunteer: _deleteVolunteer, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected,);
       //_addNewVolunteer, _deleteVolunteer
    }
    
    else if (activeScreenName == 'volunteer-login') {
      activeScreen = VolunteerLogin(changeScreen, registeredVolunteersList: widget.registeredVolunteersList, registeredDonationsrsList: widget.registeredDonationsList, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, openAddVolunteerOverlay: _openAddVolunteerOverlay, deleteVolunteer: _deleteVolunteer,);
    }

    else if (activeScreenName == 'volunteer-screen') {
      activeScreen = VolunteerScreen(volunteerLogged: loggedVolunteer, changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList:widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: _openAddVolunteerOverlay, reserve: _assignTo, isCollected: _isCollected,);
    }

    else if (activeScreenName == 'donor-screen') {
      activeScreen = DonorScreen(changeScreen: changeScreen, openAddDonationOverlay: _openAddDonationOverlay, registeredDonationsList: widget.registeredDonationsList, deleteDonation: _deleteDonation, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected,);
      //DonorScreen(changeScreen, _openAddDonationOverlay, 
      //_addNewDonation, _deleteDonation);
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Nahej Ali", style: TextStyle(fontWeight: FontWeight.bold),),
        /*actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],*/
      ),
      backgroundColor: Colors.white,
      body: activeScreen
      );
    
  }
}
import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/widgets/donations_list.dart';

class DonorScreen extends StatelessWidget{

  final Function changeScreen;
  final Function openAssignTo;
  final Function reserve;
  final Function isCollected;
  //final Widget upBar; 

  final VoidCallback openAddDonationOverlay;
  //final Function addNewDonation;
  final Function deleteDonation;

  final List<Donation> registeredDonationsList;

  const DonorScreen(
    //this.changeScreen, this.openAddDonationOverlay, 
  //this.addNewDonation, this.deleteDonation, 
      {required this.changeScreen, required this.openAddDonationOverlay, required this.deleteDonation, required this.registeredDonationsList, super.key, required this.openAssignTo, required this.reserve, required this.isCollected,}
  );

  @override
  Widget build(BuildContext context) {
     Widget mainContent = Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'No previous donations found!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
    if (registeredDonationsList.isNotEmpty) {
      mainContent = DonationsList(donationsList: registeredDonationsList, onDeleteDonation: (donation){deleteDonation(donation);}, activeScreenName: 'donor-screen', openAssignTo: openAssignTo, reserve: reserve, isCollected: isCollected,);
    }

    return //Scaffold(
      // appBar: AppBar(
      //   title: Text("Donate Now"),
      //   backgroundColor: const Color.fromARGB(255, 208, 183, 134),
      //   foregroundColor: const Color.fromARGB(255, 27, 136, 134),
      //   actions: [
      //     IconButton(
      //       onPressed: openAddDonationOverlay,
      //       icon: Icon(Icons.add),
      //     ),
      //   ],
      // ),
      // //appBar: upBar,
      // backgroundColor: Colors.white,
      
      //body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          //Expanded(child: 
            mainContent,
          //),

          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
          ),

        ],
      //),
    );
  }
}

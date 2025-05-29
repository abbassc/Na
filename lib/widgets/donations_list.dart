import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/widgets/donation_card.dart';

class DonationsList extends StatelessWidget{

  final List<Donation> donationsList;

  final String activeScreenName;

  final Function isCollected;
  final Function reserve;
  final Function openAssignTo;
  final Volunteer? volunteerLogged;
  final void Function(Donation) onDeleteDonation;
  final String? part;

  const DonationsList({required this.donationsList, required this.onDeleteDonation, super.key, required this.activeScreenName, required this.openAssignTo, required this.reserve, required this.isCollected, this.volunteerLogged, this.part,});

  @override
  Widget build(BuildContext context) {

    List<Donation> availableDonationsList = donationsList.where((donation) => !donation.isAssigned).toList();
    List<Donation> assignedTOVolunteerDonationsList = donationsList.where((donation) => donation.isAssigned && donation.volunteerAssigned?.id == volunteerLogged?.id && !donation.isCollected).toList();
    List<Donation> completedByVolunteerDonationsList = donationsList.where((donation) => donation.isCollected && donation.volunteerAssigned?.id == volunteerLogged?.id).toList();

    List<Donation> collectedDonationsList = donationsList.where((donation) => donation.isCollected).toList();
    List<Donation> pendinigDonationsList = donationsList.where((donation) => !donation.isCollected).toList();

    if(activeScreenName == 'admin-screen'){
      if(part == 'collected'){
        return ListView.builder(
          itemCount: collectedDonationsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => //DonationCard(donationsList[index])
            Dismissible(
              background: Container(
                padding: EdgeInsets.only(left: 12),
                decoration: ShapeDecoration(color: const Color.fromARGB(255, 173, 25, 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              key: ValueKey(collectedDonationsList[index]),
              child: DonationCard(collectedDonationsList[index], activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
              onDismissed: (direction) {
                onDeleteDonation(collectedDonationsList[index]);
              },
            ),
        );
      }
      return ListView.builder(
      itemCount: pendinigDonationsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => //DonationCard(donationsList[index])
        Dismissible(
          background: Container(
            padding: EdgeInsets.only(left: 12),
            decoration: ShapeDecoration(color: const Color.fromARGB(255, 173, 25, 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 25,
            ),
          ),
          key: ValueKey(pendinigDonationsList[index]),
          child: DonationCard(pendinigDonationsList[index], activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
          onDismissed: (direction) {
            onDeleteDonation(pendinigDonationsList[index]);
          },
        ),
      );
    }

    if(activeScreenName == 'donor-screen'){
      return ListView.builder(
      itemCount: donationsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => //DonationCard(donationsList[index])
        Dismissible(
          background: Container(
            padding: EdgeInsets.only(left: 12),
            decoration: ShapeDecoration(color: const Color.fromARGB(255, 173, 25, 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 25,
            ),
          ),
          key: ValueKey(donationsList[index]),
          child: DonationCard(donationsList[index], activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
          onDismissed: (direction) {
            onDeleteDonation(donationsList[index]);
          },
        confirmDismiss: (direction) {
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('Yes'),
                )
              ],
              title: Text('Delete Donation'),
              content: Text('Are you sure you want to delete this donation?'),
            ),
          );
        },
        ),
      );
    }

    if(activeScreenName == 'volunteer-screen' && part != null){
      if(part == 'tasks'){
        return ListView.builder(
          itemCount: assignedTOVolunteerDonationsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => 
            DonationCard(assignedTOVolunteerDonationsList[index], 
                activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
        );
      }
      if(part == 'archive'){
        return ListView.builder(
          itemCount: completedByVolunteerDonationsList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => 
            DonationCard(completedByVolunteerDonationsList[index], 
                activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
        );
      }
    }

    return ListView.builder(
      itemCount: availableDonationsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => 
        DonationCard(availableDonationsList[index], 
            activeScreenName: activeScreenName, openAssignTo: openAssignTo, isCollected: isCollected, volunteerLogged: volunteerLogged, reserve: reserve,),
    );
  }
}




/*import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/widgets/donation_card.dart';

class DonationsList extends StatelessWidget {
  final List<Donation> donationsList;

  const DonationsList(this.donationsList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (donationsList.isEmpty) {
      return const Center(
        child: Text(
          'لا توجد تبرّعات حالياً',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: donationsList.length,
      itemBuilder: (context, index) => DonationCard(donationsList[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}
*/



// if (donationsList.isEmpty) {
//   return Center(
//     child: Text('لا توجد تبرّعات حالياً'),
//   );
// }

// if (collectedDonationsList.isEmpty) {
//   return Center(child: Text('لا توجد تبرعات مجمعة.'));
// }



// Widget buildDonationsList(List<Donation> list, {bool dismissible = false}) {
//   if (list.isEmpty) return Center(child: Text('لا توجد تبرّعات.'));

//   return ListView.builder(
//     itemCount: list.length,
//     shrinkWrap: true,
//     itemBuilder: (context, index) {
//       final donation = list[index];
//       final card = DonationCard(
//         donation,
//         activeScreenName: activeScreenName,
//         openAssignTo: openAssignTo,
//         isCollected: isCollected,
//         volunteerLogged: volunteerLogged,
//         reserve: reserve,
//       );

//       if (dismissible) {
//         return Dismissible(
//           key: ValueKey(donation),
//           background: Container(
//             padding: EdgeInsets.only(left: 12),
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 173, 25, 15),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             alignment: Alignment.centerLeft,
//             child: Icon(Icons.delete, color: Colors.white, size: 25),
//           ),
//           confirmDismiss: activeScreenName == 'donor-screen'
//               ? (direction) => showDialog(
//                     context: context,
//                     builder: (ctx) => AlertDialog(
//                       title: Text('حذف التبرّع'),
//                       content: Text('هل أنت متأكد من حذف التبرّع؟'),
//                       actions: [
//                         TextButton(onPressed: () => Navigator.pop(context, false), child: Text('لا')),
//                         TextButton(onPressed: () => Navigator.pop(context, true), child: Text('نعم')),
//                       ],
//                     ),
//                   )
//               : null,
//           onDismissed: (_) => onDeleteDonation(donation),
//           child: card,
//         );
//       }

//       return card;
//     },
//   );
// }

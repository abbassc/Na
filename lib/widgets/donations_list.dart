import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/widgets/donation_card.dart';

class DonationsList extends StatelessWidget{

  final List<Donation> donationsList;

  final void Function(Donation) onDeleteDonation;

  const DonationsList({required this.donationsList, required this.onDeleteDonation, super.key,});

  @override
  Widget build(BuildContext context) {
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
        child: DonationCard(donationsList[index]),
        onDismissed: (direction) {
          onDeleteDonation(donationsList[index]);
        },
        // confirmDismiss: (direction) {
        //   return showDialog(
        //     context: context,
        //     builder: (ctx) => AlertDialog(
        //       actions: [
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context, false);
        //           },
        //           child: Text('No'),
        //         ),
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context, true);
        //           },
        //           child: Text('Yes'),
        //         )
        //       ],
        //       title: Text('Delete Expense'),
        //       content: Text('Are you sure you want to delete this expense?'),
        //     ),
        //   );
        // },
      ),
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

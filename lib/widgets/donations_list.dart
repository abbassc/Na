import 'package:flutter/material.dart';
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




/*
import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/widgets/donation_card.dart';

class DonationsList extends StatelessWidget{

  final List<Donation> donationsList;

  const DonationsList(this.donationsList, {super.key,});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: donationsList.length,
      itemBuilder: (context, index) => DonationCard(donationsList[index])
    );
  }
}
*/
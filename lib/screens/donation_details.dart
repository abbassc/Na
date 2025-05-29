import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';

class DonationDetails extends StatelessWidget {
  const DonationDetails({
    super.key,
    required this.donation,
  });

  final Donation donation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(donation.title),
      ),
      body: Column(),
    );
  }
}

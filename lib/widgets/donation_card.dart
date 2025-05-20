import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';

class DonationCard extends StatelessWidget{

  final Donation donation;

  const DonationCard(this.donation, {super.key,});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 208, 183, 134),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(donation.location, style: TextStyle(fontWeight: FontWeight.bold,)),
                  Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text("\$${donation.amount!.toStringAsFixed(2)}"),
                      Spacer(),
                      Row(
                        children: [
                          //Icon(categoryIcon[expense.category]),
                          SizedBox(width: 8),
                          //Text(expense.formattedDate)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), onPressed: (){}, child: Text('Assign to')),
          ],
        ),
      ),
    );
  }
}





/*import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';

class DonationCard extends StatelessWidget {
  final Donation donation;

  const DonationCard(this.donation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 208, 183, 134),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column with donation info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    donation.location,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    donation.time,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (donation.amount != null)
                    Text(
                      "Amount: \$${donation.amount!.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 14),
                    ),
                ],
              ),
            ),

            // Right: Assign button
            ElevatedButton(
              onPressed: () {
                // Handle assignment
              },
              child: const Text('Assign to'),
            ),
          ],
        ),
      ),
    );
  }
}


*/





























/*import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:intl/intl.dart'; // لتنسيق التاريخ والوقت

class DonationCard extends StatelessWidget {
  final Donation donation;

  const DonationCard(this.donation, {super.key});

  @override
  Widget build(BuildContext context) {
    final formattedAmount = donation.amount != null
        ? "\$${donation.amount!.toStringAsFixed(2)}"
        : "No Amount";
    
    final formattedTime = donation.time.isNotEmpty
        ? DateFormat.yMd().add_jm().format(DateTime.parse(donation.time))
        : "Unknown Time";

    return Card(
      color: const Color.fromARGB(255, 215, 215, 215),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              donation.location,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              formattedTime,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formattedAmount,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: const [
                    Icon(Icons.attach_money),
                    SizedBox(width: 4),
                    Text("Donation"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/widgets/chart_bar.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key,required this.donationsList,});

  final List<Donation> donationsList;

  List<DonationBucket> get buckets {
    return [
      DonationBucket.forCategory(
        donationsList,
        Category.Money,
      ),
      DonationBucket.forCategory(
        donationsList,
        Category.Food,
      ),
      DonationBucket.forCategory(
        donationsList,
        Category.Clothes,
      ),
    ];
  }

  int get maxTotalDonations {
    int max = 0;
    for (DonationBucket bucket in buckets) {
      if (bucket.numberOfDonations > max) {
        max = bucket.numberOfDonations;
      }
    }
    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            //Theme.of(context).primaryColorLight,
            Theme.of(context).colorScheme.onPrimary,
            Theme.of(context).colorScheme.onSecondary,
            ///const Color.fromARGB(29, 124, 77, 255),
            //const Color.fromARGB(115, 124, 77, 255)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (DonationBucket bucket in buckets)
                  ChartBar(
                    fill: bucket.numberOfDonations / maxTotalDonations,
                  )
              ],
            ),
          ),
          Row(
            children: Category.values
                .map(
                  (category) => Expanded(
                    child: Icon(
                      categoryIcon[category],
                      color: Theme.of(context).colorScheme.onSecondary,//const Color.fromARGB(190, 104, 58, 183),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

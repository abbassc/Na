import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';

class DonationCard extends StatelessWidget{

  final Donation donation;
  final String activeScreenName;
  final Function openAssignTo;
  final Function isCollected;
  final Volunteer? volunteerLogged;
  final Function reserve;
  final Function openDonationDetails;
  final Function openVolunteerDetails;
  final String? part;

  const DonationCard(this.donation, {super.key, required this.activeScreenName, required this.openAssignTo, required this.isCollected, this.volunteerLogged, required this.reserve, required this.openDonationDetails, required this.openVolunteerDetails, this.part, 
  //required this.reserve,
  });

  @override
  Widget build(BuildContext context) {

    Widget car = SizedBox(height: 0, width: 0,);
    if(donation.needsCar == true){
      car = Text('Needs Car!');
    }
    
    Widget amount = SizedBox(height: 0, width: 0,);
    if(donation.amount !=null && donation.amount != 0){
      amount = Text("\$${donation.amount!.toStringAsFixed(2)}");
    }

    Widget button = SizedBox(height: 0, width: 0,);
    Widget card = SizedBox(height: 0, width: 0,);
    
    //NOT Assigned donations in ADMIN screen
    if (!donation.isAssigned && activeScreenName == 'admin-screen') {
      button = ElevatedButton(
              //style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Color.fromARGB(255, 27, 136, 134), foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), 
              onPressed: (){openAssignTo(donation);}, 
              child: Text('Assign to')
            );
      card =  Card(
        child: InkWell(
              onTap: (){openDonationDetails(donation);},
              splashColor: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: const Color.fromARGB(255, 208, 183, 134),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(categoryIcon[donation.category]),
                          //Spacer(),
                          Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                      Text(donation.location,),
                      Row(
                        children: [
                          amount,
                          car,
                        ],
                      ),
                      Text('Time: ${donation.time}',),
                      
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    button,
                    Row(
                        children: [
                          //Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                          //Spacer(),
                          Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                  ],
                ),

              ],
            ),
          ),
        ),
        );
    }

    //Assigned donations in ADMIN screen
    if (donation.isAssigned && activeScreenName == 'admin-screen') {
      
      if (donation.volunteerAssigned != null){
        button = button = Container(decoration: BoxDecoration(color: Colors.deepOrangeAccent, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)), 
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(donation.volunteerAssigned!.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        if(donation.isCollected){ 
          button = button = Container(decoration: BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)), 
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(donation.volunteerAssigned!.name, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        }
      }
      else{
        button = ElevatedButton(
              //style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Color.fromARGB(255, 27, 136, 134), foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), 
              onPressed: (){openAssignTo(donation);}, 
              child: Text('Assign to')
            );
      }

      card =  Card(
        child: InkWell(
              onTap: (){openDonationDetails(donation);},
              splashColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: const Color.fromARGB(255, 208, 183, 134),
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 16,
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             //Text(donation.amount.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //             Text(donation.location, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             //Text(donation.date.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //             SizedBox(height: 4),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 amount,
          //                 Spacer(),
          //                 Row(
          //                   spacing: 2,
          //                   children: [
          //                     //Icon(categoryIcon[donation.category]),
          //                     //SizedBox(width: 8),
          //                     Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),

          //       button,

          //     ],
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(categoryIcon[donation.category]),
                          //Spacer(),
                          Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                      Text(donation.location,),
                      Row(
                        children: [
                          amount,
                          car,
                        ],
                      ),
                      Text('Time: ${donation.time}',),
                      
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    button,
                    Row(
                        children: [
                          //Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                          //Spacer(),
                          Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                  ],
                ),

              ],
            ),
          ),
        ),
        );
        // if(part == 'details-assigned' && donation.isAssigned && donation.volunteerAssigned == volunteerLogged && !donation.isCollected){
          
        // }
        // if((part == 'details-completed' && donation.isAssigned && donation.volunteerAssigned == volunteerLogged && donation.isCollected)){

        // }
    }

    // Assigned donations to a specific Volunteer in VOLUNTEER screen 'TASKS'
    if((donation.isAssigned && activeScreenName == 'volunteer-screen' && donation.volunteerAssigned == volunteerLogged && !donation.isCollected) ){
      button = ElevatedButton(
              //style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), 
              onPressed:(){ 
                isCollected(donation, volunteerLogged);
                }, 
              child: Text('Complete')
            );
      card =  Card(
        child: InkWell(
              onTap: (){openDonationDetails(donation);},
              splashColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: const Color.fromARGB(255, 208, 183, 134),
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 16,
          //   ),
            
          //     child: Row(
          //       children: [
          //         Expanded(
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
          //               Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
          //               //Text(donation.amount.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //               Text(donation.location, style: TextStyle(fontWeight: FontWeight.bold,)),
          //               //Text(donation.date.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //               SizedBox(height: 4),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   amount,
          //                   Spacer(),
          //                   Row(
          //                     spacing: 2,
          //                     children: [
          //                       //Icon(categoryIcon[donation.category]),
          //                       //SizedBox(width: 8),
          //                       Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //               Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
          //               Text(donation.donorPhone.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //               car,
          //             ],
          //           ),
          //         ),
              
          //         button,
              
          //       ],
          //     ),
          //   ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(categoryIcon[donation.category]),
                          //Spacer(),
                          Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                      Text(donation.location,),
                      Text(donation.donorPhone.toString(),),
                      Row(
                        children: [
                          amount,
                          car,
                        ],
                      ),
                      Text('Time: ${donation.time}',),
                      
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    button,
                    Row(
                        children: [
                          //Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                          //Spacer(),
                          Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                  ],
                ),

              ],
            ),
          ),
          ),
        );
    }

    // Completed donations by a specific Volunteer in VOLUNTEER screen  'DONE'
    if((donation.isAssigned && activeScreenName == 'volunteer-screen' && donation.volunteerAssigned == volunteerLogged && donation.isCollected)){
      button = Container(decoration: BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(10)), 
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text('Complete'),
      ),);
      card =  Card(
        child: InkWell(
              onTap: (){openDonationDetails(donation);},
              splashColor: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(16),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: const Color.fromARGB(255, 208, 183, 134),
          // child: Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 16,
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             //Text(donation.amount.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //             //Text(donation.location, style: TextStyle(fontWeight: FontWeight.bold,)),
          //             //Text(donation.date.toString(), style: TextStyle(fontWeight: FontWeight.bold,)),
          //             SizedBox(height: 4),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 amount,
          //                 Spacer(),
          //                 Row(
          //                   spacing: 2,
          //                   children: [
          //                     //Icon(categoryIcon[donation.category]),
          //                     //SizedBox(width: 8),
          //                     Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),

          //       button,

          //     ],
          //   ),
          // ),
          
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Row(
                        spacing: 10,
                        children: [
                          Icon(categoryIcon[donation.category]),
                          //Spacer(),
                          Text(donation.category.name, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                      Text(donation.location,),
                      Text(donation.donorPhone.toString(),),
                      Row(
                        children: [
                          amount,
                          car,
                        ],
                      ),
                      Text('Time: ${donation.time}',),
                      
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 15,
                  children: [
                    button,
                    Row(
                        children: [
                          //Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                          //Spacer(),
                          Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                  ],
                ),

              ],
            ),
          ),
        ), 
        );
    }

    //NOT Assigned donations (AVAILABLE) in Volunteer screen
    if (!donation.isAssigned && activeScreenName == 'volunteer-screen'){
      button = ElevatedButton(
              // style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 27, 136, 134), surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), 
              onPressed:(){ 
                reserve(donation, volunteerLogged);
                }, 
              child: Text('Reserve')
            );
      card =  Card(
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          // color: const Color.fromARGB(255, 208, 183, 134),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Text(donation.title, style: TextStyle(fontWeight: FontWeight.bold,)),
                      Text(donation.location,),
                      car,
                      Text('Time: ${donation.time}',),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: [
                    button,
                    Row(
                        children: [
                          //Text(donation.time, style: TextStyle(fontWeight: FontWeight.bold,)),
                          //Spacer(),
                          Text(donation.formattedDate, style: TextStyle(fontWeight: FontWeight.bold,)),
                        ],
                      ),
                  ],
                ),

              ],
            ),
          ),
        );
    }


    
    return card;
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








// Widget buildCardContent({
//   required String category,
//   required String location,
//   required String date,
//   required String time,
//   required Widget amount,
//   required Widget button,
//   Widget? carInfo,
//   String? phone,
// }) {
//   return Card(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//     color: const Color.fromARGB(255, 208, 183, 134),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 Text(location, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     amount,
//                     const Spacer(),
//                     Row(
//                       children: [
//                         Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                   ],
//                 ),
//                 Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 if (phone != null) Text(phone, style: const TextStyle(fontWeight: FontWeight.bold)),
//                 if (carInfo != null) carInfo,
//               ],
//             ),
//           ),
//           button,
//         ],
//       ),
//     ),
//   );
// }





















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


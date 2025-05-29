import 'package:nahej_ali/db/database.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';

void updateDonation({required Donation donation, required Volunteer volunteerAssigned, required bool isAssigned, required bool isCollected,}) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();

  // update a donation 
  int assignedInt = isAssigned ? 1 : 0;
  int collectedInt = isCollected ? 1 : 0;

  db.update('donations', 
    {'isAssigned': assignedInt, 'isCollected': collectedInt, 'volunteerAssignedId': volunteerAssigned?.id,}, 
    where: 'id = ?',
    whereArgs: [donation.id],
  );

}

// Future<void> updateDonation({
//   required Donation donation,
//   required Volunteer volunteerAssigned,
//   required bool isAssigned,
//   required bool isCollected,
// }) async {
//   NahejAliDatabase database = NahejAliDatabase();
//   final db = await database.getDatabase();

//   int assignedInt = isAssigned ? 1 : 0;
//   int collectedInt = isCollected ? 1 : 0;

//   await db.update(
//     'donations',
//     {
//       'isAssigned': assignedInt,
//       'isCollected': collectedInt,
//       'volunteerAssignedId': volunteerAssigned.id,
//     },
//     where: 'id = ?',
//     whereArgs: [donation.id],
//   );
// }


void insertDonation(Donation donation) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // insert donation into the database
  //print(donation.donationMap);
  db.insert('donations', donation.donationMap);
}

// Future<void> insertDonation(Donation donation) async {
//   // get an instance of the database
//   NahejAliDatabase database = NahejAliDatabase();
//   final db = await database.getDatabase();
//   // insert donation into the database
//   print(donation.donationMap);
//   await db.insert('donations', donation.donationMap);
// }

Future<List<Donation>> loadDonations() async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // get all donations from the database
  final result = await db.query('donations');
  final volunteers = await loadVolunteers();

  // map every row into an Expense object
  List<Donation> resultList = result.map((row) {
    Volunteer? assigned = null;
    Volunteer toReturn = Volunteer.named(phone: 0, name: '', location: '', availability: '');
    if(row['volunteerAssignedId'] != null ){
      String existVolunteerId = (volunteers.firstWhere((volunteer) => volunteer.id == row['volunteerAssignedId'],orElse: () => toReturn,)).id;
      if(existVolunteerId != toReturn.id){
      assigned = volunteers.firstWhere((volunteer) => volunteer.id == row['volunteerAssignedId'], );
      }
    }
    return Donation.named(
      // cast every object into its corresponding type
      id: row['id'] as String,
      amount: row['amount'] != null ? row['amount'] as double : 0,
      title: row['title'] as String,
      // covert the date int from milliseconds to a DateTime object
      date: DateTime.fromMillisecondsSinceEpoch(row['date'] as int),
      //convert every category string into type Category enum
      // Use ! at the end of the variable name to tell Dart not to check for null values
      category: categoryName[row['category'] as String]!,
      time: row['time'] as String,
      location: row['location'] as String,
      donorPhone: row['donorPhone'] != null ? row['donorPhone'] as int : 0,///////////
      needsCar: (row['needsCar'] != null ? row['needsCar'] as int : 0) == 1 ,
      volunteerAssigned: assigned ,
      isAssigned: (row['isAssigned'] as int? ?? 0) == 1,
      isCollected: (row['isCollected'] as int? ?? 0) == 1,
    );
  }).toList();
  // return the resulting donations list
  return resultList;
}

void deleteDonation(Donation donation) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // delete a donation with a specific id
  db.delete('donations', where: 'id = ?', whereArgs: [donation.id]);
}






void insertVolunteer(Volunteer volunteer) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // insert donation into the database
  db.insert('volunteers', volunteer.volunteerMap);
}

Future<List<Volunteer>> loadVolunteers() async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // get all donations from the database
  final result = await db.query('volunteers');
  // map every row into an Expense object
  List<Volunteer> resultList = result.map((row) {
    return Volunteer.named(
      // cast every object into its corresponding type
      id: row['id'] as String,
      name: row['name'] as String,
      // Use ! at the end of the variable name to tell Dart not to check for null values
      location: row['location'] as String,
      availability: row['availability'] as String, 
      phone: row['phone'] as int,
    );
  }).toList();
  // return the resulting donations list
  return resultList;
}

void deleteVolunteer(Volunteer volunteer) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // delete a donation with a specific id
  db.delete('volunteers', where: 'id = ?', whereArgs: [volunteer.id]);
}

//where((volunteer){row['volunteerAssinged'] != null ? row['volunteerAssinged'] as int : null == volunteer.id;})
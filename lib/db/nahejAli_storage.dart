import 'package:nahej_ali/db/database.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';

void insertDonation(Donation donation) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // insert donation into the database
  db.insert('donations', donation.donationMap);
}

Future<List<Donation>> loadDonations() async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // get all donations from the database
  final result = await db.query('donations');
  // map every row into an Expense object
  List<Donation> resultList = result.map((row) {
    return Donation.named(
      // cast every object into its corresponding type
      id: row['id'] as String,
      amount: row['amount'] as double,
      title: row['title'] as String,
      // covert the date int from milliseconds to a DateTime object
      date: DateTime.fromMillisecondsSinceEpoch(row['date'] as int),
      //convert every category string into type Category enum
      // Use ! at the end of the variable name to tell Dart not to check for null values
      category: categoryName[row['category'] as String]!,
      time: row['time'] as String,
      location: row['location'] as String,
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

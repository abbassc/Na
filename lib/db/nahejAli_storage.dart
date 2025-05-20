import 'package:nahej_ali/db/database.dart';
import 'package:nahej_ali/models/donation.dart';

void insertDonation(Donation donation) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // insert donation into the database
  /////////db.insert('donations', donation.donationMap);
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
      /////////id: row['id'] as String,
      amount: row['amount'] as double,
      /////////title: row['title'] as String,
      // covert the date int from milliseconds to a DateTime object
      /////////date: DateTime.fromMillisecondsSinceEpoch(row['date'] as int),
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

void deleteExpense(Donation donation) async {
  // get an instance of the database
  NahejAliDatabase database = NahejAliDatabase();
  final db = await database.getDatabase();
  // delete a donation with a specific id
  ////////db.delete('donations', where: 'id = ?', whereArgs: [donation.id]);
}

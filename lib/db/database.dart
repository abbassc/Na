import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class NahejAliDatabase {
  Future<Database> getDatabase() async {
    // get the default databases location
    String dbPath = await getDatabasesPath();
    // If the database is already created, get an instance of it.
    // If it is not there, onCreate is executed
    Database db = await openDatabase(
      join(dbPath, 'nahejAli.db'),
      
      // executed only when the database is not there or when the version is incremented
      onCreate: (db, version) {
        db.execute('CREATE TABLE volunteers(id TEXT PRIMARY KEY, name TEXT, phone INT, location TEXT, availability TEXT)'); 
        db.execute('CREATE TABLE donations(id TEXT PRIMARY KEY, title TEXT, amount DOUBLE, category TEXT, date INT, time Text, location TEXT, donorPhone INT, isAssigned BOOLEAN, isCollected BOOLEAN, volunteerAssignedId TEXT, needsCar BOOLEAN)');
        },
      // increment version number only when the database scheme changes: add/drop table, add/drop column, add/drop relation
      version: 1,
    );
    return db;
  }
}

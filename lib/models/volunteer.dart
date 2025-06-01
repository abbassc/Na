import 'package:uuid/uuid.dart';

class Volunteer {

  final String id;
  final int phone;
  final String name;
  final String location;
  final String availability;

  Volunteer.named( {required this.phone, required this.name, required this.location, required this.availability, id}) : id = id ?? Uuid().v4();

  // Create a getter to create a map for every volunteer object.
  // This map is used to insert data into the database.
  Map<String, Object?> get volunteerMap {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'location': location,
      'availability': availability,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Volunteer &&
          runtimeType == other.runtimeType &&
          id == other.id; 

  @override
  int get hashCode => id.hashCode;

}
class Volunteer {

  //final int id;
  //final int phone;
  final String name;
  final String location;
  final String availability;

  const Volunteer (this.name, this.location, this.availability);
  Volunteer.named({required this.name, required this.location, required this.availability,});

}
enum Category { Money, Food, Clothes }

class Donation {
  final String location;
  final String time;
  final double? amount;
  final Category category;

  const Donation({
    required this.location,
    required this.time,
    this.amount,
    this.category = Category.Money,
  });
}






/*enum Category {Money, Food, Clothes}

class Donation {

  //final String title;
  final String location;
  final String time;
  final double? amount;
  final Category category;

  const Donation(this.location, this.time, [this.category = Category.Money, this.amount]);

}*/
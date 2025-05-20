import 'package:flutter/material.dart';

enum Category {Money, Food, Clothes}

const categoryName = {
  'money': Category.Money,
  'food': Category.Food,
  'clothes': Category.Clothes,
  };

const categoryIcon = {
  Category.Money: Icons.money,
  Category.Food: Icons.food_bank,
  Category.Clothes: Icons.water,
};
class Donation {

  //final String title;
  //final int id;
  //final DateTime date;
  final String location;
  final String time;
  final double? amount;
  final Category category;
  final bool isAssigned;

  const Donation(this.location, this.time, [this.category = Category.Money, this.amount, this.isAssigned = false]);
  Donation.named({
    this.location = '',
    this.time = '',
    this.amount,
    this.category = Category.Money,
    this.isAssigned = false
  });


  void assign(){
    //isAssigned = true;
  }

}


/*enum Category { Money, Food, Clothes }

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
*/

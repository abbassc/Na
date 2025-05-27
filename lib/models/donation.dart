import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:uuid/uuid.dart';

enum Category {Money, Food, Clothes}

const categoryName = {
  'Money': Category.Money,
  'Food': Category.Food,
  'Clothes': Category.Clothes,
  };

const categoryIcon = {
  Category.Money: Icons.money,
  Category.Food: Icons.food_bank,
  Category.Clothes: Icons.water,
};
class Donation {

  final String id;
  final String title;  
  final String location;
  final String time;
  final DateTime date;
  final Category category;
  final double? amount;
  bool isAssigned = false;
  bool isCollected = false;
  Volunteer? volunteerAssigned;
  final int donorPhone;
  bool needsCar = false;

  //Donation(this.location, this.time, [this.category = Category.Money, this.amount, this.isAssigned = false]);
  Donation.named({
    required this.title,
    required this.location,
    required this.time,
    required this.date,
    required this.donorPhone,
    this.category = Category.Money,
    this.amount = 1,
    this.isAssigned = false,
    this.needsCar = false,  
    this.volunteerAssigned,
    this.isCollected = false,
    id})
    : id = id ?? Uuid().v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Donation &&
          runtimeType == other.runtimeType &&
          id == other.id; 

  @override
  int get hashCode => id.hashCode;


  void assign(){
    isAssigned = true;
  }

  void collect(){
    isCollected = true;
  }

  

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }

  Map<String, Object?> get donationMap {
  return {
    'id': id,
    'title': title,
    'location': location,
    'time': time,
    'date': date.millisecondsSinceEpoch,
    'category': category.name,
    'amount': amount,
    'donorPhone' : donorPhone,
    'isAssigned': isAssigned ? 1 : 0,
    'needsCar': needsCar ? 1 : 0,
    'volunteerAssignedId' : volunteerAssigned?.id,
    'isCollected' : isCollected ? 1 : 0,
  };
}

}

// Create a getter to create a map for every donation object.
// This map is used to insert data into the database.


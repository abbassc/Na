/*import 'package:nahej_ali/models/donation.dart';

const donations = [
  Donation('Dahye', '4:00PM', Category.Money, 50),
  Donation('Basta', '3:00PM', Category.Money, 100),
  Donation('Dahye', '1:00PM', Category.Clothes),
  Donation('Msaytbe', '2:00PM', Category.Food),
];

*/


import 'package:nahej_ali/models/donation.dart';

  List donations = [
  Donation.named(
    location: 'Dahye',
    time: '4:00PM',
    category: Category.Money,
    amount: 50, 
    date: DateTime.now(), 
    title: 'ولادة الرسول',
  ),
  Donation.named(
    location: 'Basta',
    time: '3:00PM',
    category: Category.Money,
    amount: 100,
    date: DateTime.now(), 
    title: 'ولادة الرسول',
  ),
  Donation.named(
    location: 'Dahye',
    time: '1:00PM',
    category: Category.Clothes,
    date: DateTime.now(), 
    title: 'ولادة الرسول',
  ),
  Donation.named(
    location: 'Msaytbe',
    time: '2:00PM',
    category: Category.Food,
    date: DateTime.now(), 
    title: 'ولادة الرسول',
  ),
];




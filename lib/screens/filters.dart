import 'package:flutter/material.dart';
import 'package:nahej_ali/models/donation.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Category, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _moneyFilterSet = true;
  var _foodFilterSet = true;
  var _clothesFilterSet = true;

  @override
  void initState() {
    _moneyFilterSet = widget.currentFilters[Category.Money]!;
    _foodFilterSet = widget.currentFilters[Category.Food]!;
    _clothesFilterSet = widget.currentFilters[Category.Clothes]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        leading: BackButton(
          onPressed: () {
            var result = {
              Category.Money: _moneyFilterSet,
              Category.Food: _foodFilterSet,
              Category.Clothes: _clothesFilterSet,
            };
            Navigator.pop(context, result);
          },
        ),
      ),
      body: Column(children: [
        SwitchListTile(
          value: _moneyFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _moneyFilterSet = isChecked;
            });
          },
          title: Text('Money'),
          subtitle: Text('Only include money donations.'),
          contentPadding: EdgeInsets.only(
            left: 30,
            right: 20,
          ),
        ),
        SwitchListTile(
          value: _foodFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _foodFilterSet = isChecked;
            });
          },
          title: Text('Food'),
          subtitle: Text('Only include food donations.'),
          contentPadding: EdgeInsets.only(
            left: 30,
            right: 20,
          ),
        ),
        SwitchListTile(
          value: _clothesFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _clothesFilterSet = isChecked;
            });
          },
          title: Text('Clothes'),
          subtitle: Text('Only include clothes donations.'),
          contentPadding: EdgeInsets.only(
            left: 30,
            right: 20,
          ),
        )
      ]),
    );
  }
}

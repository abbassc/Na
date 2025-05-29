import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onFiltersTap, required this.onThemesTap});

  final void Function() onFiltersTap;
  final void Function() onThemesTap;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(167, 155, 39, 176),
                  const Color.fromARGB(57, 155, 39, 176),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments,
                  size: 45,
                ),
                SizedBox(height: 20),
                Text(
                  'Nahej ALi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Filters'),
            onTap: onFiltersTap,
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Themes'),
            onTap: onFiltersTap,
          )
        ],
      ),
    );
  }
}

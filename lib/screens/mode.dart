import 'package:flutter/material.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({
    super.key,
    required this.currentMode,
  });

  final ThemeMode currentMode;

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {

  var _darkModeSet = false;

  @override
  void initState() {
    _darkModeSet = widget.currentMode == ThemeMode.dark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light/Dark Mode'),
        leading: BackButton(
          onPressed: () {
            // var result = ;
            Navigator.pop(context, _darkModeSet ? ThemeMode.dark : ThemeMode.light);
          },
        ),
      ),
      body: Column(children: [
        SwitchListTile(
          value: _darkModeSet,
          onChanged: (isChecked) {
            setState(() {
              _darkModeSet = isChecked;
            });
          },
          title: Text('Dark'),
          subtitle: Text('Switch to Dark Mode.'),
          contentPadding: EdgeInsets.only(
            left: 30,
            right: 20,
          ),
        ),
      ]),
    );
  }
}





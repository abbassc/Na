import 'package:flutter/material.dart';
import 'package:nahej_ali/themes/nahej_ali_theme_data.dart';
import 'package:provider/provider.dart';



class ThemesAdminScreen extends StatefulWidget {
  const ThemesAdminScreen({
    super.key,
    required this.currentTheme,
  });

  final AppThemeChoice currentTheme;

  @override
  State<ThemesAdminScreen> createState() => _ThemesAdminScreenState();
}

class _ThemesAdminScreenState extends State<ThemesAdminScreen> {

  late AppThemeChoice _selectedTheme;

  @override
  void initState() {
    _selectedTheme = widget.currentTheme;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Themes'),
        leading: BackButton(
          onPressed: () {
            // var result
            Navigator.pop(context, _selectedTheme);
          },
        ),
      ),
      body: Center(
        child: DropdownButton<AppThemeChoice>(
                value: _selectedTheme,
                items: [
                  DropdownMenuItem(value: AppThemeChoice.original, child: Text('Original Theme')),
                  DropdownMenuItem(value: AppThemeChoice.palestine, child: Text('Palestine Theme')),
                  DropdownMenuItem(value: AppThemeChoice.ramadan, child: Text('Ramadan Theme')),
                  DropdownMenuItem(value: AppThemeChoice.ashura, child: Text('Ashura Theme')),
                  DropdownMenuItem(value: AppThemeChoice.eid, child: Text('Eid Theme')),
                ],
                onChanged: (newTheme) {
                  if (newTheme != null) {
                    setState(() {
                      _selectedTheme = newTheme;
                    });
                    themeManager.setTheme(newTheme);
                  }
                },
              ),
      ),
    );
  }
}




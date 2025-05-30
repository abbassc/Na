import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onFiltersTap, required this.onThemesTap, required this.onModeTap});

  final void Function() onFiltersTap;
  final void Function() onThemesTap;
  final void Function() onModeTap;


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
            onTap: onThemesTap,
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Mode'),
            onTap: onModeTap,
          ),
        ],
      ),
    );
  }
}





// class ThemeSettingsWidget extends StatelessWidget {
//   const ThemeSettingsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeManager = context.watch<ThemeManager>();

//     return Column(
//       children: [
//         // Dropdown to select theme
//         DropdownButton<AppThemeMode>(
//           value: themeManager.currentTheme,
//           items: AppThemeMode.values.map((theme) {
//             return DropdownMenuItem(
//               value: theme,
//               child: Text(theme.toString().split('.').last.toUpperCase()),
//             );
//           }).toList(),
//           onChanged: (newTheme) {
//             if (newTheme != null) {
//               themeManager.setTheme(newTheme);
//             }
//           },
//         ),

//         // Switch to toggle dark/light mode manually
//         SwitchListTile(
//           title: const Text('Dark Mode'),
//           value: themeManager.themeMode == ThemeMode.dark,
//           onChanged: (value) {
//             themeManager.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
//           },
//         ),
//       ],
//     );
//   }
// }



// DropdownButton<AppThemeMode>(
//   value: context.watch<ThemeManager>().currentTheme,
//   onChanged: (AppThemeMode? newTheme) {
//     if (newTheme != null) {
//       context.read<ThemeManager>().setTheme(newTheme);
//     }
//   },
//   items: AppThemeMode.values.map((theme) {
//     return DropdownMenuItem(
//       value: theme,
//       child: Text(theme.toString().split('.').last.toUpperCase()),
//     );
//   }).toList(),
// ),





// DropdownButton<AppThemeMode>(
//   value: themeManager.currentTheme,
//   items: AppThemeMode.values.map((theme) {
//     return DropdownMenuItem(
//       value: theme,
//       child: Text(theme.toString().split('.').last),
//     );
//   }).toList(),
//   onChanged: (newTheme) {
//     if (newTheme != null) {
//       themeManager.setTheme(newTheme);
//     }
//   },
// )

// SwitchListTile(
//   title: Text('Dark Mode'),
//   value: themeManager.themeMode == ThemeMode.dark,
//   onChanged: (value) {
//     themeManager.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
//   },
// )




// class ThemeSwitcher extends StatelessWidget {
//   const ThemeSwitcher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeManager = Provider.of<ThemeManager>(context);

//     return DropdownButton<AppThemeMode>(
//       value: themeManager.currentTheme,
//       onChanged: (newTheme) {
//         if (newTheme != null) {
//           themeManager.setTheme(newTheme);
//         }
//       },
//       items: AppThemeMode.values.map((themeMode) {
//         return DropdownMenuItem(
//           value: themeMode,
//           child: Text(themeMode.name.toUpperCase()),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nahej_ali/themes/nahej_ali_theme_data.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onFiltersTap, required this.onThemesTap, required this.onModeTap, required this.activeScreenName, required this.activePart});

  final void Function() onFiltersTap;
  final void Function() onThemesTap;
  final void Function() onModeTap;

  final String activeScreenName;
  final String activePart;


  @override
  Widget build(BuildContext context) {

    final themeManager = Provider.of<ThemeManager>(context);
    AssetImage logo ;//= AssetImage('assets/images/temp-03.jpg');
    DrawerHeader head;// =  DrawerHeader(
          //   padding: EdgeInsets.all(0),
          //   decoration: BoxDecoration(image: DecorationImage(image: logo),),
          //   child: Column(
          //      crossAxisAlignment: CrossAxisAlignment.stretch,
          //      mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       // Icon(
          //       //   Icons.payments,
          //       //   size: 45,
          //       // ),
          //       SizedBox(height: 20),
          //       // Text(
          //       //   'Nahej ALi',
          //       //   textAlign: TextAlign.center,
          //       //   style: TextStyle(
          //       //     fontWeight: FontWeight.w600,
          //       //   ),
          //       // ),
          //     ],
          //    ),
          // );

    if(Theme.of(context).brightness == Brightness.dark){
      if(themeManager.currentTheme == AppThemeChoice.original){
        logo = AssetImage('assets/images/temp-02.jpg');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              color: Color.fromARGB(255,26,136,137),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.palestine){
        logo = AssetImage('assets/images/logoNA02.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.ramadan){
        logo = AssetImage('assets/images/logoNA02.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.ashura){
        logo = AssetImage('assets/images/temp-05.jpg');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else {
        logo = AssetImage('assets/images/logoNA.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
    }
    else {
      if(themeManager.currentTheme == AppThemeChoice.original){
        logo = AssetImage('assets/images/temp-03.jpg');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.palestine){
        logo = AssetImage('assets/images/temp-04.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.ramadan){
        logo = AssetImage('assets/images/logoNA02.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else if(themeManager.currentTheme == AppThemeChoice.ashura){
        logo = AssetImage('assets/images/temp-05.jpg');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
      else {
        logo = AssetImage('assets/images/logoNA.png');
        head = DrawerHeader(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              image: DecorationImage(image: logo),
              //color: Color.fromARGB(255,27,139,139),
            ),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [SizedBox(height: 20),],
             ),
          );
      }
    }

    Widget listTiles = Column(
      children: [
        
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
    );

    if(activeScreenName == 'admin-screen' && (activePart == 'Donations' || activePart == 'Collected')){
      listTiles = Column(
        children: [
          ListTile(
            leading: Icon(Icons.color_lens),
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
      );
    }


    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          head,

          listTiles,

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

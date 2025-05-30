import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class NahejALiThemeData extends ThemeData{

//   const NahejALiThemeData() {}
  
// }

enum AppThemeChoice {
  original,
  palestine,
  ramadan,
  ashura,
  eid,
}

class ThemeManager extends ChangeNotifier {

  ThemeMode _currentMode = ThemeMode.system;
  AppThemeChoice _currentTheme = AppThemeChoice.original;

  AppThemeChoice get currentTheme => _currentTheme;
  ThemeMode get currentMode => _currentMode;

  void setTheme(AppThemeChoice theme) {
    if(theme != currentTheme){
      _currentTheme = theme;
      notifyListeners();
    }
  }

  void setMode(ThemeMode mode) {
    if(mode != currentMode){
      _currentMode = mode;
      notifyListeners();
    }
  }

  ThemeData get lightTheme {
    switch (_currentTheme) {
      case AppThemeChoice.palestine:
        return NahejAliThemeConfig.lightPalestineTheme;
      case AppThemeChoice.ramadan:
        return NahejAliThemeConfig.lightRamadanTheme;
      case AppThemeChoice.ashura:
        return NahejAliThemeConfig.lightAshuraTheme;
      case AppThemeChoice.eid:
        return NahejAliThemeConfig.lightEidTheme;
      case AppThemeChoice.original:
      default:
        return NahejAliThemeConfig.lightOriginalTheme;
    }
  }

  ThemeData get darkTheme {
    switch (_currentTheme) {
      case AppThemeChoice.palestine:
        return NahejAliThemeConfig.darkPalestineTheme;
      case AppThemeChoice.ramadan:
        return NahejAliThemeConfig.darkRamadanTheme;
      case AppThemeChoice.ashura:
        return NahejAliThemeConfig.darkAshuraTheme;
      case AppThemeChoice.eid:
        return NahejAliThemeConfig.darkEidTheme;
      case AppThemeChoice.original:
      default:
        return NahejAliThemeConfig.darkOriginalTheme;
    }
  }
}


class NahejAliColors {
  static const primary1 =  Color.fromARGB(255, 27, 136, 134);
  static const secondary1 = Color.fromARGB(255, 208, 183, 134);

  static const primary2 = Color.fromARGB(255,149,188,213);
  static const secondary2 = Color.fromARGB(255,233,151,141);

  static const primary3 = Color.fromARGB(255,234,150,140);
  static const secondary3 = Color.fromARGB(255,168,180,117);

  static const primary4 = Color.fromARGB(255,182,51,53);
  static const secondary41 = Colors.black;//Color.fromARGB(255,198,185,164);
  static const secondary42 = Color.fromARGB(255,198,185,164);

  static const primary55 = Color.fromARGB(255,182,102,173);
  static const secondary55 = Color.fromARGB(255,211,184,137);




  // static Color tertiary3(BuildContext context) {
  //   return Theme.of(context).brightness == Brightness.light
  //       ? const Color(0xFF69C0FF)
  //       : const Color(0xFF0094FF);
  // }




  static Color getThemeAccentColor(BuildContext context, String occasion) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    switch (occasion) {
      case 'Original':
        return isLight ? primary1 : secondary1;
      case 'Palestine':
        return isLight ? primary2 : secondary2;
      case 'Ramadan':
        return isLight ? primary3 : secondary3;
      case 'Ashura':
        return isLight ? primary4 : secondary42; // or secondary41 based on meaning
      case 'Eid':
        return isLight ? primary55 : secondary55;
      default:
        return isLight ? secondary1 : primary1;
    }
  }


  static Color originalThemeAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? NahejAliColors.primary1
        : NahejAliColors.secondary1;
  }

  static Color palestineThemeAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? NahejAliColors.primary2
        : NahejAliColors.secondary2;
  }

  static Color ramadanThemeAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? NahejAliColors.primary3
        : NahejAliColors.secondary3;
  }

  static Color ashuraThemeAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? NahejAliColors.primary4
        : NahejAliColors.secondary41;
  }

  static Color eidThemeAccent(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? NahejAliColors.primary55
        : NahejAliColors.secondary55;
  }

}

class NahejAliThemeConfig {

  static ThemeData lightOriginalTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      //primaryColor: NahejAliColors.secondary1,
      //scaffoldBackgroundColor: NahejAliColors.primary1,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: NahejAliColors.primary1, onPrimary: const Color.fromARGB(255, 160, 141, 103), secondary: NahejAliColors.secondary1, onSecondary: const Color.fromARGB(255, 21, 103, 102), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.primary1, brightness: Brightness.light,),
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.primary1, surfaceTintColor: NahejAliColors.primary1, foregroundColor: NahejAliColors.secondary1, side: BorderSide(color: NahejAliColors.primary1), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.primary1)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.primary1, surfaceTintColor: Color.fromARGB(255, 204, 136, 1), foregroundColor: NahejAliColors.primary1),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.secondary1, backgroundColor: NahejAliColors.primary1,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.secondary1, backgroundColor: NahejAliColors.primary1, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.secondary1,),
      scaffoldBackgroundColor: Colors.white,
    );

  static ThemeData darkOriginalTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      //primaryColor: NahejAliColors.primary1,
      //scaffoldBackgroundColor: NahejAliColors.secondary1,
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: NahejAliColors.secondary1, onPrimary: const Color.fromARGB(255, 117, 102, 74), secondary: NahejAliColors.primary1, onSecondary: const Color.fromARGB(255, 15, 79, 77), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.secondary1, brightness: Brightness.dark,),
      
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold, /*color: colorScheme.onSurface*/),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic, /*color: colorScheme.onSurface*/),
        bodyMedium: GoogleFonts.merriweather(color: Colors.white),
        displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.secondary1, surfaceTintColor: NahejAliColors.secondary1, foregroundColor: NahejAliColors.primary1, side: BorderSide(color: NahejAliColors.secondary1), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.secondary1)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.secondary1, surfaceTintColor: const Color.fromARGB(255, 0, 180, 177), foregroundColor: NahejAliColors.secondary1),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.primary1, backgroundColor: const Color.fromARGB(255, 156, 138, 101),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.primary1, backgroundColor: const Color.fromARGB(255, 156, 138, 101), unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.primary1,),
      scaffoldBackgroundColor: const Color.fromARGB(255, 50, 75, 75),
    );



  static ThemeData lightPalestineTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // primaryColor: NahejAliColors.primary2,
      // scaffoldBackgroundColor: NahejAliColors.secondary2,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: NahejAliColors.secondary2, onPrimary: const Color.fromARGB(255, 117, 148, 168), secondary: NahejAliColors.primary2, onSecondary: const Color.fromARGB(255, 183, 119, 111), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.secondary2, brightness: Brightness.dark,),
            

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.primary2, surfaceTintColor: NahejAliColors.primary2, foregroundColor: NahejAliColors.secondary2, side: BorderSide(color: NahejAliColors.primary2), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.primary2)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.primary2, surfaceTintColor: const Color.fromARGB(255, 230, 28, 1), foregroundColor: NahejAliColors.primary2,),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.secondary2, backgroundColor: NahejAliColors.primary2,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.secondary2, backgroundColor: NahejAliColors.primary2, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.secondary2,),
      scaffoldBackgroundColor: Colors.white,
    );

  static ThemeData darkPalestineTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // primaryColor: NahejAliColors.secondary2,
      // scaffoldBackgroundColor: NahejAliColors.primary2,
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: NahejAliColors.primary2, onPrimary: const Color.fromARGB(255, 88, 111, 126), secondary: NahejAliColors.secondary2, onSecondary: const Color.fromARGB(255, 130, 84, 78), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.primary2, brightness: Brightness.dark,),
            
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(color: Colors.white),
        displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.secondary2, surfaceTintColor: NahejAliColors.secondary2, foregroundColor: NahejAliColors.primary2, side: BorderSide(color: NahejAliColors.secondary2), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.secondary2)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.secondary2, surfaceTintColor: const Color.fromARGB(255, 1, 127, 206), foregroundColor: NahejAliColors.secondary2),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.primary2, backgroundColor: const Color.fromARGB(255, 172, 112, 104),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.primary2, backgroundColor: const Color.fromARGB(255, 172, 112, 104), unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.primary2,),
      scaffoldBackgroundColor: const Color.fromARGB(255, 78, 85, 89),
    );



  static ThemeData lightRamadanTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // primaryColor: NahejAliColors.primary3,
      // scaffoldBackgroundColor: NahejAliColors.secondary3,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: NahejAliColors.secondary3, onPrimary: const Color.fromARGB(255, 177, 113, 106), secondary: NahejAliColors.primary3, onSecondary: const Color.fromARGB(255, 135, 144, 94), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.secondary3, brightness: Brightness.dark,),
            

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.primary3, surfaceTintColor: NahejAliColors.primary3, foregroundColor: NahejAliColors.secondary3, side: BorderSide(color: NahejAliColors.primary3), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.primary3)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.primary3, surfaceTintColor: const Color.fromARGB(255, 147, 180, 2), foregroundColor: NahejAliColors.primary3),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.secondary3, backgroundColor: NahejAliColors.primary3,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.secondary3, backgroundColor: NahejAliColors.primary3, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.secondary3,),
      scaffoldBackgroundColor: Colors.white,
    );

  static ThemeData darkRamadanTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // primaryColor: NahejAliColors.secondary3,
      // scaffoldBackgroundColor: NahejAliColors.primary3,
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: NahejAliColors.primary3, onPrimary: const Color.fromARGB(255, 128, 81, 76), secondary: NahejAliColors.secondary3, onSecondary: const Color.fromARGB(255, 91, 97, 64), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.primary3, brightness: Brightness.dark,),
            
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(color: Colors.white),
        displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.secondary3, surfaceTintColor: NahejAliColors.secondary3, foregroundColor: NahejAliColors.primary3, side: BorderSide(color: NahejAliColors.secondary3), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.secondary3)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.secondary3, surfaceTintColor: const Color.fromARGB(255, 220, 22, 0), foregroundColor: NahejAliColors.secondary3),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.primary3, backgroundColor: NahejAliColors.secondary3,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.primary3, backgroundColor: NahejAliColors.secondary3, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.primary3,),
      scaffoldBackgroundColor: const Color.fromARGB(255, 95, 82, 80),
    );



  static ThemeData lightAshuraTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // primaryColor: NahejAliColors.primary4,
      // scaffoldBackgroundColor: NahejAliColors.secondary41,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: NahejAliColors.primary4, onPrimary: NahejAliColors.secondary42, secondary: NahejAliColors.secondary41, onSecondary: NahejAliColors.secondary42, error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.primary4, brightness: Brightness.dark,),
            

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.primary4, surfaceTintColor: NahejAliColors.primary4, foregroundColor: NahejAliColors.secondary42, side: BorderSide(color: NahejAliColors.primary4), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.primary4)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.primary4, surfaceTintColor: NahejAliColors.secondary42, foregroundColor: NahejAliColors.primary4),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.secondary42, backgroundColor: NahejAliColors.primary4,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.secondary42, backgroundColor: Colors.black, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.secondary42,),
      scaffoldBackgroundColor: Colors.white,
    );

  static ThemeData darkAshuraTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // primaryColor: NahejAliColors.secondary42,
      // scaffoldBackgroundColor: NahejAliColors.primary4,
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: NahejAliColors.secondary42, onPrimary: Colors.black, secondary: NahejAliColors.primary4, onSecondary: Colors.black, error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.secondary42, brightness: Brightness.dark,),
            
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(color: Colors.white),
        displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.secondary41, surfaceTintColor: NahejAliColors.secondary42, foregroundColor: NahejAliColors.primary4, side: BorderSide(color: NahejAliColors.secondary41), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.secondary42)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.secondary41, surfaceTintColor: NahejAliColors.primary4, foregroundColor: NahejAliColors.secondary41),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.primary4, backgroundColor: NahejAliColors.secondary41,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.primary4, backgroundColor: NahejAliColors.secondary41, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.primary4,),
      scaffoldBackgroundColor: const Color.fromARGB(255, 74, 57, 57),
    );

  

  static ThemeData lightEidTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      // primaryColor: NahejAliColors.secondary55,
      // scaffoldBackgroundColor: NahejAliColors.primary55,
      colorScheme: ColorScheme(brightness: Brightness.light, primary: NahejAliColors.primary55, onPrimary: const Color.fromARGB(255, 169, 147, 110), secondary: NahejAliColors.secondary55, onSecondary: const Color.fromARGB(255, 147, 83, 139), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.primary55, brightness: Brightness.dark,),
            

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(),
        displaySmall: GoogleFonts.pacifico(),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.primary55, surfaceTintColor: NahejAliColors.primary55, foregroundColor: NahejAliColors.secondary55, side: BorderSide(color: NahejAliColors.primary55), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.primary55)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.primary55, surfaceTintColor: const Color.fromARGB(255, 212, 135, 2), foregroundColor: NahejAliColors.primary55),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.secondary55, backgroundColor: NahejAliColors.primary55,),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.secondary55, backgroundColor: NahejAliColors.primary55, unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.secondary55,),
      scaffoldBackgroundColor: Colors.white,
    );

  static ThemeData darkEidTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // primaryColor: NahejAliColors.primary55,
      // scaffoldBackgroundColor: NahejAliColors.secondary55,
      colorScheme: ColorScheme(brightness: Brightness.dark, primary: NahejAliColors.secondary55, onPrimary: const Color.fromARGB(255, 112, 98, 72), secondary: NahejAliColors.primary55, onSecondary: const Color.fromARGB(255, 102, 57, 96), error: Colors.red, onError: const Color.fromARGB(255, 154, 43, 35), surface: Colors.white, onSurface: Colors.black),
      //colorScheme: ColorScheme.fromSeed(seedColor: NahejAliColors.secondary55, brightness: Brightness.dark,),
            
      

      /////////////////////////////////////////////////////////////////////////////
      textTheme: TextTheme(
        displayLarge: TextStyle( fontSize: 72, fontWeight: FontWeight.bold,),
        titleLarge: GoogleFonts.oswald(fontSize: 30, fontStyle: FontStyle.italic,),
        bodyMedium: GoogleFonts.merriweather(color: Colors.white),
        displaySmall: GoogleFonts.pacifico(color: Colors.white),
        ), 
      ///////////////////////////////////////////////////////////////////////////////


      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(backgroundColor: NahejAliColors.secondary55, surfaceTintColor: NahejAliColors.secondary55, foregroundColor: NahejAliColors.primary55, side: BorderSide(color: NahejAliColors.secondary55), ),),
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(NahejAliColors.secondary55)),),
      //iconButtonTheme: IconButtonThemeData(style: ElevatedButton.styleFrom(shadowColor: NahejAliColors.secondary55, surfaceTintColor: const Color.fromARGB(255, 179, 0, 158), foregroundColor: NahejAliColors.secondary55),),
      appBarTheme: AppBarTheme(foregroundColor: NahejAliColors.primary55, backgroundColor: const Color.fromARGB(255, 152, 132, 98),),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: NahejAliColors.primary55, backgroundColor: const Color.fromARGB(255, 152, 132, 98), unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),),
      //drawerTheme: DrawerThemeData(),
      cardTheme: CardThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: NahejAliColors.primary55,),
      scaffoldBackgroundColor: const Color.fromARGB(255, 75, 62, 74),
    );



}

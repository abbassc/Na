import 'package:flutter/material.dart';
import 'package:nahej_ali/db/nahejAli_storage.dart';
import 'package:nahej_ali/models/donation.dart';
import 'package:nahej_ali/models/volunteer.dart';
import 'package:nahej_ali/screens/admin_screen.dart';
import 'package:nahej_ali/screens/chart.dart';
import 'package:nahej_ali/screens/donor_screen.dart';
import 'package:nahej_ali/screens/filters.dart';
import 'package:nahej_ali/screens/home_screen.dart';
import 'package:nahej_ali/screens/mode.dart';
import 'package:nahej_ali/screens/theme_admin.dart';
import 'package:nahej_ali/screens/volunteer_login.dart';
import 'package:nahej_ali/screens/volunteer_screen.dart';
import 'package:nahej_ali/themes/nahej_ali_theme_data.dart';
import 'package:nahej_ali/widgets/assign_to.dart';
import 'package:nahej_ali/widgets/main_drawer.dart';
import 'package:nahej_ali/widgets/new_donation.dart';
import 'package:nahej_ali/widgets/new_volunteer.dart';
import 'package:provider/provider.dart';

class NahejAliApp extends StatefulWidget{
  const NahejAliApp({super.key, required this.registeredDonationsList, required this.registeredVolunteersList,});

  final List<Donation> registeredDonationsList;
  final List<Volunteer> registeredVolunteersList;

  @override
  State<NahejAliApp> createState() {
    return _NahejAliAppState();
  }
}

class _NahejAliAppState extends State<NahejAliApp>{

  late Volunteer loggedVolunteer;

  String activeScreenName = 'home-screen';

  int _selecteAdmindIndex = 0;
  int _selecteVolunteerdIndex = 0;

  Map<Category, bool> _selectedFilters = {
    Category.Money: true,
    Category.Food: true,
    Category.Clothes: true,
  };

  void _openThemeAdminScreen(BuildContext context) async {
    final themeManager = Provider.of<ThemeManager>(context, listen: false);

    final selectedTheme = await Navigator.push<AppThemeChoice>(
      context,
      MaterialPageRoute(
        builder: (context) => ThemesAdminScreen(currentTheme: themeManager.currentTheme),
      ),
    );

    if (selectedTheme != null && selectedTheme != themeManager.currentTheme) {
      setState(() {
        themeManager.setTheme(selectedTheme);
      }); 
    }
  }

  void _openModeScreen(BuildContext context) async {
    final themeManager = Provider.of<ThemeManager>(context, listen: false);
    
    final selectedMode = await Navigator.push<ThemeMode>(
      context,
      MaterialPageRoute(
        builder: (context) => ModeScreen(currentMode: themeManager.currentMode),
      ),
    );

    if (selectedMode != null) {
      setState(() {
        themeManager.setMode(selectedMode);
      });
    }
    
  }
  

  void _openFiltersScreen() async {
    Navigator.pop(context);
    final result = await Navigator.push<Map<Category, bool>>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FiltersScreen(
          currentFilters: _selectedFilters,
        ),
      ),
    );
    setState(() {
      _selectedFilters = result ??
          {
            Category.Money: true,
            Category.Food: true,
            Category.Clothes: true,
          };
    });
  }


  void _selectAdminPart(int index) {
    setState(() {
      _selecteAdmindIndex = index;
    });
  }

  void _selectVolunteerPart(int index) {
    setState(() {
      _selecteVolunteerdIndex = index;
    });
  }







  void changeScreen(String screenName, {Volunteer? volunteer}){
    activeScreenName = screenName;
    if (screenName == 'volunteer-screen'){
      loggedVolunteer = volunteer!;
    }
    setState(() {
      
    });
  }

  void _openAssignToOverlay(Donation donation) {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AssignTo(donationToAssign: donation, _assignTo, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: _openAssignToOverlay, changeScreen: changeScreen, reserve: _assignTo, isCollected: _isCollected, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList),
      );
    //});
  }

  void _assignTo(Donation donation, Volunteer volunteer) async {
    donation.volunteerAssigned = volunteer;
    donation.assign();
    setState(() {});
    updateDonation(donation: donation, isAssigned: true, volunteerAssigned: volunteer, isCollected: false, /*isCollected: false*/);
    if(activeScreenName == 'admin-screen'){
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Donation assigned successfuly'),
          content: Text('"${donation.title}" is assigned to "${volunteer.name}".'),
        ),
      );
    }
    else{
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Donation reserved successfuly'),
          content: Text('"${donation.title}" is added to your tasks "${volunteer.name}".'),
        ),
      );
    }
  }

  void _isCollected(Donation donation, Volunteer collectorVolunteer) async {
    setState(() {
      donation.collect();
    });
    updateDonation(donation: donation, isCollected: true, isAssigned: true, volunteerAssigned: collectorVolunteer);
  }

  // void _itNeedsCar(Donation donation, bool value) async {
  //   setState(() {
  //     donation.needsCar = value;// ?? false;
  //   });
  // }




  void _openAddDonationOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewDonation(_addNewDonation, /*itNeedsCar: _itNeedsCar,*/),
    );
  }

  void _addNewDonation(Donation donation) async {
    setState(() {
      // now, when you want to use registeredDonationList in the State class, you use the widget varaible
      widget.registeredDonationsList.add(donation);
    });
    // insert the new donation to the database
    insertDonation(donation);
  }

  void _deleteDonation(Donation donation) {
    int index = widget.registeredDonationsList.indexOf(donation);
    setState(() {
      widget.registeredDonationsList.remove(donation);
      // delete the donation from the database
      deleteDonation(donation);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.registeredDonationsList.insert(index, donation);
              // insret the donation again if the user revert the action
              insertDonation(donation);
            });
          },
        ),
      ),
    );
  }



  void _openAddVolunteerOverlay() {
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewVolunteer(_addNewVolunteer),
      );
    //});
  }

  void _addNewVolunteer(Volunteer volunteer) async {
    setState(() {
      // now, when you want to use registeredDonationList in the State class, you use the widget varaible
      widget.registeredVolunteersList.add(volunteer);
    });
    // insert the new donation to the database
    insertVolunteer(volunteer);
  }

  void _deleteVolunteer(Volunteer volunteer) {
    int index = widget.registeredVolunteersList.indexOf(volunteer);
    setState(() {
      widget.registeredVolunteersList.remove(volunteer);
      // delete the volunteer from the database
      deleteVolunteer(volunteer);
    });
    //WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Volunteer Deleted"),
          duration: Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                widget.registeredVolunteersList.insert(index, volunteer);
                // insret the volunteer again if the user revert the action
                insertVolunteer(volunteer);
              });
            },
          ),
        ),
      );
    //});
  }







  @override
  Widget build(BuildContext context) {

    Widget activeScreen = HomeScreen(changeScreen);
    Widget activeDrawer = Text("");//SizedBox(height: 0, width: 0,);
    Widget activeBottomNavigationBar = Text("");//SizedBox(height: 0, width: 0,);
    var activeAppBar = AppBar(
        //  foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        //  backgroundColor: const Color.fromARGB(255, 27, 136, 134),
         title: Text("Nahej Ali", style: TextStyle(fontWeight: FontWeight.bold),),
         /*actions: [
           IconButton(
             onPressed: () {},
             icon: Icon(Icons.add),
           ),
         ],*/
       );

    if(activeScreenName == 'home-screen'){
      activeDrawer =  MainDrawer(
        onFiltersTap: _openFiltersScreen, 
        onThemesTap: (){_openThemeAdminScreen(context);}, 
        onModeTap: (){_openModeScreen(context);}, 
        activeScreenName: activeScreenName,
      );
    }

    if(activeScreenName == 'assign-to'){
      activeScreenName = 'admin-screen';
    }

    if (activeScreenName == 'admin-screen') {
      activeScreen = AdminScreen(changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteDonation: _deleteDonation, deleteVolunteer: _deleteVolunteer, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Volunteers',);
      //activeScreen = AdminTabsScreen(registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, changeScreen: changeScreen, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, openAddVolunteerOverlay: _openAddDonationOverlay, deleteVolunteer: _deleteVolunteer, deleteDonation: _deleteDonation, selecteAdmindIndex: _selecteAdmindIndex, );
      activeAppBar = AppBar(
        // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Nahej Ali - Admin", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: _openAddVolunteerOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      );
      activeDrawer = MainDrawer(
        onFiltersTap: _openFiltersScreen, 
        onThemesTap: (){_openThemeAdminScreen(context);}, 
        onModeTap: (){_openModeScreen(context);},
        activeScreenName: activeScreenName,
      );
      activeBottomNavigationBar = BottomNavigationBar(
        // selectedItemColor: const Color.fromARGB(255, 208, 183, 134),
        // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        // unselectedItemColor: const Color.fromARGB(255, 213, 213, 213),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Volunteers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Collected',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.leaderboard),
          //   label: 'Chart',
          // ),
        ],
        onTap: _selectAdminPart,
        currentIndex: _selecteAdmindIndex,
      );

      if (_selecteAdmindIndex == 1) {
        activeScreen = AdminScreen(changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteDonation: _deleteDonation, deleteVolunteer: _deleteVolunteer, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Donations',);
        activeAppBar = AppBar(
          // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
          // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
          title: Text("Nahej Ali - Admin", style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [
            // IconButton(
            //   onPressed: _openAddVolunteerOverlay,
            //   icon: Icon(Icons.add),
            // ),
          ],
        );
      }
      if (_selecteAdmindIndex == 2) {
        activeScreen = AdminScreen(changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteDonation: _deleteDonation, deleteVolunteer: _deleteVolunteer, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Collected',);
          activeAppBar = AppBar(
          // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
          // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
          title: Text("Nahej Ali - Admin", style: TextStyle(fontWeight: FontWeight.bold),),
          // actions: [
          //   IconButton(
          //     onPressed: _openAddVolunteerOverlay,
          //     icon: Icon(Icons.add),
          //   ),
          // ],
        );
      }
      if (_selecteAdmindIndex == 3) {
        activeScreen = ChartScreen(donationsList: widget.registeredDonationsList,);
        activeAppBar = AppBar(
          // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
          // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
          title: Text("Nahej Ali - Admin", style: TextStyle(fontWeight: FontWeight.bold),),
          // actions: [
          //   IconButton(
          //     onPressed: _openAddVolunteerOverlay,
          //     icon: Icon(Icons.add),
          //   ),
          // ],
        );
      }
    }
    
    else if (activeScreenName == 'volunteer-login') {
      activeScreen = VolunteerLogin(changeScreen, registeredVolunteersList: widget.registeredVolunteersList, registeredDonationsList: widget.registeredDonationsList, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected, openAddVolunteerOverlay: _openAddVolunteerOverlay, deleteVolunteer: _deleteVolunteer,);
      activeAppBar = AppBar(
        // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Nahej Ali - Volunteer Login", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          // IconButton(
          //   onPressed: _openAddVolunteerOverlay,
          //   icon: Icon(Icons.add),
          // ),
        ],
      );
      activeDrawer = MainDrawer(
        onFiltersTap: _openFiltersScreen, 
        onThemesTap: (){_openThemeAdminScreen(context);}, 
        onModeTap: (){_openModeScreen(context);},
        activeScreenName: activeScreenName,
      );
    }

    else if (activeScreenName == 'volunteer-screen') {
      activeScreen = VolunteerScreen(volunteerLogged: loggedVolunteer, changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: _openAddVolunteerOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Tasks',);
      activeAppBar = AppBar(
        // foregroundColor: const Color.fromARGB(255, 208, 183, 134),
        // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Nahej Ali - Volunteer", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          // IconButton(
          //   onPressed: _openAddVolunteerOverlay,
          //   icon: Icon(Icons.add),
          // ),
        ],
      );
      activeDrawer = MainDrawer(
        onFiltersTap: _openFiltersScreen,
        onThemesTap: (){_openThemeAdminScreen(context);}, 
        onModeTap: (){_openModeScreen(context);},
        activeScreenName: activeScreenName,
      );
      activeBottomNavigationBar = BottomNavigationBar(
        // fixedColor: const Color.fromARGB(255, 208, 183, 134),
        // backgroundColor: const Color.fromARGB(255, 27, 136, 134),
        //selectedItemColor: Colors.red,
        // unselectedItemColor: const Color.fromARGB(255, 224, 224, 224),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Available',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Archive',
          ),
        ],
        onTap: _selectVolunteerPart,
        currentIndex: _selecteVolunteerdIndex,
      );

      if (_selecteVolunteerdIndex == 1) {
      activeScreen = VolunteerScreen(volunteerLogged: loggedVolunteer, changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: _openAddVolunteerOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Available',);
      }
      if (_selecteVolunteerdIndex == 2) {
      activeScreen = VolunteerScreen(volunteerLogged: loggedVolunteer, changeScreen: changeScreen, openAddVolunteerOverlay: _openAddVolunteerOverlay, registeredDonationsList: widget.registeredDonationsList, registeredVolunteersList: widget.registeredVolunteersList, deleteVolunteer: deleteVolunteer, openAssignTo: _openAddVolunteerOverlay, reserve: _assignTo, isCollected: _isCollected, activePart: 'Archive',);
      }
    }

    else if (activeScreenName == 'donor-screen') {
      activeScreen = DonorScreen(changeScreen: changeScreen, openAddDonationOverlay: _openAddDonationOverlay, registeredDonationsList: widget.registeredDonationsList, deleteDonation: _deleteDonation, openAssignTo: _openAssignToOverlay, reserve: _assignTo, isCollected: _isCollected,);
      activeDrawer = MainDrawer(
        onFiltersTap: _openFiltersScreen,
        onThemesTap: (){_openThemeAdminScreen(context);}, 
        onModeTap: (){_openModeScreen(context);},
        activeScreenName: activeScreenName,
      );
      activeAppBar = AppBar(
        // backgroundColor: const Color.fromARGB(255, 208, 183, 134),
        // foregroundColor: const Color.fromARGB(255, 27, 136, 134),
        title: Text("Donate Now", style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: _openAddDonationOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      );
    }

    return 
     Scaffold(
      appBar: activeAppBar,
    //AppBar(
    //   //   foregroundColor: const Color.fromARGB(255, 208, 183, 134),
    //   //   backgroundColor: const Color.fromARGB(255, 27, 136, 134),
    //   //   title: Text("Nahej Ali", style: TextStyle(fontWeight: FontWeight.bold),),
    //   //   /*actions: [
    //   //     IconButton(
    //   //       onPressed: () {},
    //   //       icon: Icon(Icons.add),
    //   //     ),
    //   //   ],*/
    //   // ),   
       body: activeScreen,
      //  backgroundColor: Colors.white,
       drawer: activeDrawer,
       bottomNavigationBar: activeBottomNavigationBar,
     );
    
  }
}
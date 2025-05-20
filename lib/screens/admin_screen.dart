import 'package:flutter/material.dart';
import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';
class AdminScreen extends StatelessWidget {
  final Function changeScreen;

  const AdminScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // حدد عرض وارتفاع محدد للقائمة بدل Expanded
                SizedBox(
                  width: 250,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Volunteers:', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Expanded(child: VolunteersList(volunteers)),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.black,
                        foregroundColor: const Color.fromARGB(255, 208, 183, 134),
                        side: const BorderSide(color: Color.fromARGB(255, 27, 136, 134)),
                      ),
                      onPressed: () {
                        // Add Volunteer logic
                      },
                      child: const Text('Add Volunteer'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // نفس الشيء لشاشة التبرعات (يمكن اضافة حجم محدد مستقبلاً)

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Donations:'),
                const SizedBox(width: 20),
                const Text('blabla'), // استبدل هذه لاحقاً بقائمة التبرعات
              ],
            ),
          ),

          IconButton.filled(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 27, 136, 134),
              ),
            ),
            hoverColor: const Color.fromARGB(255, 208, 183, 134),
            onPressed: () {
              changeScreen('home-screen');
            },
            icon: Image.asset(
              'assets/images/home.png',
              scale: 12,
            ),
          ),
        ],
      ),
    );
  }
}






/*import 'package:flutter/material.dart';
import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class AdminScreen extends StatelessWidget {
  final Function changeScreen;

  const AdminScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Volunteers:'),
                    const SizedBox(height: 10),
                    Expanded(child: VolunteersList(volunteers)),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.black,
                        foregroundColor: const Color.fromARGB(255, 208, 183, 134),
                        side: const BorderSide(color: Color.fromARGB(255, 27, 136, 134)),
                      ),
                      onPressed: () {
                        // Add Volunteer logic
                      },
                      child: const Text('Add Volunteer'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Donations:'),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    Text('blabla'), // replace with DonationsList or similar
                  ],
                ),
              ],
            ),
          ),

          IconButton.filled(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 27, 136, 134),
              ),
            ),
            hoverColor: const Color.fromARGB(255, 208, 183, 134),
            onPressed: () {
              changeScreen('home-screen');
            },
            icon: Image.asset(
              'assets/images/home.png',
              scale: 12,
            ),
          ),
        ],
      ),
    );
  }
}

*/










/*import 'package:flutter/material.dart';
import 'package:nahej_ali/data/volunteers.dart';
import 'package:nahej_ali/widgets/volunteers_list.dart';

class AdminScreen extends StatelessWidget{

  final Function changeScreen;

  const AdminScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('Volunteers:'),
                    VolunteersList(volunteers),
                  ],
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    ElevatedButton(style: ElevatedButton.styleFrom(surfaceTintColor: Colors.black, foregroundColor: Color.fromARGB(255, 208, 183, 134), side: BorderSide(color: Color.fromARGB(255, 27, 136, 134))), onPressed: (){}, child: Text('Add Volunteer'))
                  ],
                ),
            
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('Donations:'),
                  ],
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('blabla'),
                  ],
                ),
            
              ],
            ),
          ),

          IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 12,),),
        ],
      ),
    );
  }

}*/
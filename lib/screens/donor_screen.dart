import 'package:flutter/material.dart';

class DonorScreen extends StatelessWidget{

  final Function changeScreen;

  const DonorScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
     Widget mainContent = Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          'No previous donations found!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate Now"),
        backgroundColor: const Color.fromARGB(255, 208, 183, 134),
        foregroundColor: const Color.fromARGB(255, 27, 136, 134),
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 20,),),
          ),
        ],
      ),
    );
  }
}

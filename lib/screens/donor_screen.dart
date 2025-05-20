import 'package:flutter/material.dart';

class DonorScreen extends StatelessWidget{

  final Function changeScreen;

  const DonorScreen(this.changeScreen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton.filled(style: ButtonStyle(backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 27, 136, 134)),), hoverColor: Color.fromARGB(255, 208, 183, 134), onPressed: (){changeScreen('home-screen');}, icon: Image.asset('assets/images/home.png', scale: 12,),),
    );  }

}
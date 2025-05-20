import 'package:flutter/material.dart';
import 'package:nahej_ali/app/nahej_ali_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NahejAliApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

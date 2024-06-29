import 'package:flutter/material.dart';
import 'package:jpgtopdf/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pdf Maker',
      debugShowCheckedModeBanner: false,
      home:  SplashScreen(),
    );
  }
}

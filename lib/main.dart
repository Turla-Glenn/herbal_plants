import 'package:flutter/material.dart';
import 'package:herbal_plants/screens/home_page.dart';
import 'package:herbal_plants/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crop D Tech',
      home: SplashScreen(),
    );
  }
}

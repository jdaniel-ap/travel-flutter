import 'package:flutter/material.dart';
import 'package:traveler/screens/home.dart';
import 'package:traveler/utils/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SouthTraveler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: kSecondaryColor,
        ),
        scaffoldBackgroundColor: kBackground,
      ),
      home: const Home(),
    );
  }
}

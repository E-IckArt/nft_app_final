import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app_final/app_wrapper.dart';

import 'my_wallet_page.dart';
import 'on_boarding_pager.dart';

void main() {
  runApp(const MyApp());
  // runApp(const AppWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Argent Facile NFT',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 42, fontWeight: FontWeight.w900, color: Colors.black),
            titleLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
          headlineLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
            bodySmall: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
            bodyMedium: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black,
            ),
            bodyLarge: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black,
            ),
      ),
      ),
      home: const OnboardingPager(),
      // home: const AppWrapper(),
    );
  }
}

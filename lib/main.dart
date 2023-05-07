import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'on_boarding_pager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Argent Facile NFT',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Roboto',
          textTheme: GoogleFonts.robotoTextTheme()
      ),
      home: const OnboardingPager(),
    );
  }
}


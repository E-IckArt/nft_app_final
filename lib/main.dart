import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_wallet_page.dart';
import 'on_boarding_pager.dart';

void main() {
  // runApp(const MyApp());
  runApp(const AppWrapper());
}

/*class MyApp extends StatelessWidget {
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
}*/

class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  bool skipOnboarding = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Argent Facile NFT',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'Roboto',
          textTheme: GoogleFonts.robotoTextTheme()),
      home: skipOnboarding ? const MyWalletPage(title: "My Wallet") : const OnboardingPager(),
    );
    //A vous de jouer ;)
  }
}
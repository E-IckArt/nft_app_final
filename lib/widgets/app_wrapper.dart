import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/my_wallet_page.dart';
import '../views/Onboarding/on_boarding_pager.dart';

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
          colorScheme: ColorScheme.fromSwatch().copyWith(
            brightness: Brightness.light,
            primary: Colors.deepPurple,
            secondary: Colors.tealAccent ,
            tertiary: Colors.white,
          ),
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          splashColor: Colors.tealAccent,
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 42, fontWeight: FontWeight.w900, letterSpacing: 1.25),
            titleLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 1.25),
            headlineLarge: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 1.25),
            headlineMedium: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.25),
            bodySmall: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 1.25),
            bodyMedium: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.25),
            bodyLarge: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 1.25),
          )),
      home: skipOnboarding ? const MyWalletPage(title: "My Wallet") : const OnboardingPager(),
    );
    //A vous de jouer ;)
  }
}
import 'package:flutter/material.dart';
import 'package:nft_app_final/app_wrapper.dart'; // Used to disable onboarding pages
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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.light,
          primary: Colors.deepPurple,
          secondary: Colors.tealAccent ,
          tertiary: Colors.white,
        ),
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
      home: const OnboardingPager(),
      // home: const AppWrapper(),
    );
  }
}

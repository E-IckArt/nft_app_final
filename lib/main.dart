import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app_final/page_1.dart';
import 'package:nft_app_final/page_2.dart';
import 'package:nft_app_final/page_3.dart';

import 'my_wallet_page.dart';

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
      // When using initialRoute, don’t define a home property.
      // home: const OnboardingPager(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Page1(title: 'Page 1',),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Page2(title: 'Page 2'),
        '/third': (context) => const Page3(title: 'Page 3'),
        '/my-wallet-page': (context) => const MyWalletPage(title: 'My Wallet'),

      },
    );
  }
}


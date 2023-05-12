import 'package:flutter/material.dart';

// Used to enable or disable onboarding pages
import 'package:nft_app_final/widgets/app_wrapper.dart';

void main() {
  // runApp(const MyApp());
  runApp(const AppWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: OnboardingPager(),
      home: AppWrapper(),
    );
  }


}

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:nft_app_final/views/Onboarding/page_1.dart';
import 'package:nft_app_final/views/Onboarding/page_2.dart';
import 'package:nft_app_final/views/Onboarding/page_3.dart';

class OnboardingPager extends StatelessWidget {
  const OnboardingPager({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Container(
        color: const Color.fromARGB(255, 240, 239, 235),
        child: PageView(
          controller: controller,
          children: <Widget>[
            const Center(
              child: Page1(title: "Argent Facile NFT"),
            ),
            Center(
              child: Page2(title: "Argent Facile NFT"),
            ),
            const Center(
              child: Page3(title: "Argent Facile NFT"),
            )
          ],
        ),
      ),
    );
  }
}

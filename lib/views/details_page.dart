import 'package:flutter/material.dart';
import 'package:nft_app_final/model/character.dart';
// import 'package:galaxies_app/userService.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({super.key , required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      body: Center(
        child: ElevatedButton(
            onPressed: goBack(), child: const Text('Go Back')),
      ),
    );
  }

  goBack() {
    print('Test');
  }
}

import 'package:flutter/material.dart';
import 'package:nft_app_final/model/character.dart';

import '../widgets/buttons/button_buy.dart';
// import 'package:galaxies_app/userService.dart';

class DetailsPage extends StatelessWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [

          Card(
              child: SizedBox(
                child: Image.network(character.image),
          )),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(character.name),
                Text(character.location.name),
                Text(character.origin.name),
                Text(character.species.name),
                Text(character.type),
                Text(createRarityText(character.rarity)),

              ],
            ),
          ),
          ButtonBuy(),
          SizedBox(
            width: 50,
            child: ElevatedButton(
                onPressed: (() => goBack(context)), child: const Text('Go Back')),
          ),
        ]),
      ),
    );
  }

  void goBack(context) {
    Navigator.pop(context);
  }
}


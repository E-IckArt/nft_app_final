import 'dart:ffi';

import 'package:flutter/material.dart';
import '../model/character.dart';
import '../rick_and_morty_api.dart';

class MarketPlace extends StatefulWidget {
  // final items = List.generate(20, (i) => i);

  MarketPlace({
    super.key,
    required this.title,
  }) {
    // loadCharacter();
  }

  // loadCharacter() async {
  //   final results = await RickAndMortyApiState().getCharacters();
  // }

  final String title;

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = RickAndMortyApiState().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 7.0),
          child: Center(
            child: FutureBuilder<List<Character>>(
                future: futureCharacters,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Character character = snapshot.data?[index];
                        return Card(
                          clipBehavior: Clip.hardEdge,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(character.name),
                                subtitle: Text(character.type),
                                trailing:
                                    const Icon(Icons.chevron_right_outlined),
                                onTap: (() => {openPage(context, character)}),
                              ),
                              SizedBox(
                                child: Image.network(
                                  character.image,
                                  fit: BoxFit.cover,
                                  width: double.maxFinite,
                                  height: 250,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dernière position connue',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          Text(
                                            character.location.name,
                                            style: Theme.of(context).textTheme.headlineSmall,
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            'Aperçu dans',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          Text(
                                            'character.episode[0]',
                                              style: Theme.of(context).textTheme.headlineSmall,
                                            ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: createStatusColor(
                                                    character.status),
                                                radius: 5,
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                '${character.status.name} - ${character.species.name}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Chip(
                                                  label: Text(createRarityText(
                                                      character.rarity),
                                                  style: Theme.of(context).textTheme.headlineSmall),
                                                  backgroundColor: createRarityColor(
                                                      character.rarity)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                  Icons.currency_bitcoin_rounded, size: 18,),
                                              Text(createPrice(character.price, character.id).toString(),
                                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                    color: Colors.black).copyWith(
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              TextButton(
                                                onPressed: () {/* ... */},
                                                child: Text('ACHETER',
                                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                        color: Theme.of(context).colorScheme.primary).copyWith(
                                                    fontWeight: FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 16);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('ERROR: ${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),
          )),
    );
  }

  openPage(context, character) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }

  String createRarityText(Rarity rarity) {
    switch (rarity) {
      case Rarity.COMMON:
        return 'Commun';
      case Rarity.RARE:
        return 'Rare';
      case Rarity.EPIC:
        return 'Epique';
      case Rarity.LEGENDARY:
        return 'Légendaire';
      default:
        return 'Inconnu';
    }
  }

  createPrice(double price, id) {
        return price * 1.5 * id;
  }

  Color createRarityColor(Rarity rarity) {
    switch (rarity) {
      case Rarity.COMMON:
        return const Color(0xFFDEF8E7);
      case Rarity.RARE:
        return const Color(0xFFE8DEF8);
      case Rarity.EPIC:
        return Colors.deepPurpleAccent.shade100;
      case Rarity.LEGENDARY:
        return Colors.yellowAccent;
      default:
        return Colors.grey;
    }
  }

  Color createStatusColor(Status status) {
    switch (status) {
      case Status.ALIVE:
        return Colors.green;
      case Status.DEAD:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}

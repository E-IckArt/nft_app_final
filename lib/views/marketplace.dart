import 'package:flutter/material.dart';
import '../model/character.dart';
import '../rick_and_morty_api.dart';

class MarketPlace extends StatefulWidget {
  final items = List.generate(20, (i) => i);

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
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Center(
            child: FutureBuilder<List<Character>>(
                future: futureCharacters,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
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
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // textAlign: TextAlign.start,
                                    children: [
                                      Text(
                                        'Dernière position connue',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          textBaseline: TextBaseline.alphabetic,
                                        ),
                                      ),
                                      Text(
                                        character.location.name,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Aperçu dans',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          textBaseline: TextBaseline.alphabetic,
                                        ),
                                      ),
                                      Text(
                                        character.episode[0],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          textBaseline: TextBaseline.alphabetic,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('${character.status.name} - ${character.species.name}',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.teal);
                      },
                      itemCount: snapshot.data!.length,
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
}

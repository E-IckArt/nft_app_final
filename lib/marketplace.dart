import 'package:flutter/material.dart';
import 'model/character.dart';
import 'rick_and_morty_api.dart';

class MarketPlace extends StatefulWidget {
  final items = List.generate(20, (i) => i);

  MarketPlace({
    super.key,
    required this.title,
  }) {
    loadCharacter();
  }

  loadCharacter() async {
    final results = await RickAndMortyApiState().getCharacters();
  }

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
                        return ListTile(
                          title: Text(character.name),
                          subtitle: Text(character.type),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: (() => { openPage(context, character)}),
                          
                        );

                      },
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.teal);
                      } ,
                      itemCount: snapshot.data!.length,
                      // children: [
                      //
                      //   MaterialButton(
                      //     onPressed: () => {RickAndMortyApiState().getCharacters()},
                      //     shape: const RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(35))),
                      //     textColor: Colors.white,
                      //     color: Colors.tealAccent[400],
                      //     height: 36,
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 10, vertical: 8),
                      //       child: Text(
                      //         'API CALL',
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .headlineMedium
                      //             ?.copyWith(
                      //                 color: Theme.of(context)
                      //                     .colorScheme
                      //                     .tertiary),
                      //       ),
                      //     ),
                      //   ),
                      // ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('ERROR: ${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }

                ),
          )),
    );
  }

  openPage(context, character) {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }
}


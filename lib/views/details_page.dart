import 'package:flutter/material.dart';
import 'package:nft_app_final/model/character.dart';
import 'package:nft_app_final/episode_api.dart';
import 'package:nft_app_final/model/episode.dart';

import '../widgets/buttons/button_buy.dart';
import 'package:nft_app_final/widgets/episode.dart' as episode_widget;

class DetailsPage extends StatefulWidget {
  final Character character;

  const DetailsPage({super.key, required this.character});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<List<Episode>> futureEpisodes;

  @override
  void initState() {
    super.initState();
    futureEpisodes = EpisodeApiState().getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    var character = widget.character;
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Center(
        child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget> [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: Image.network(character.image),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        buildText(character.name.toUpperCase()),
                        Chip(
                          label: Text(createRarityText(character.rarity),
                              style: Theme.of(context).textTheme.headlineSmall),
                          backgroundColor: createRarityColor(character.rarity),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                    buildText('Localisation : ${character.location.name}'),
                    buildText('Planète d\'origine : ${character.origin.name}'),
                    buildText('Espèce : ${character.species.name}'),
                    buildText('Genre : ${character.gender.name.toString()}'),
                    buildText(character.type == ""
                        ? "Sous-espèce : pas de sous-espèce connue"
                        : 'Sous-espèce : ${character.type}'),
                    buildText(createRarityText(character.rarity)),
                    buildText(character.episode == null
                        ? 'Nombre d\'épisode inconnu'
                        : 'Nombre d\'épisode : ${character.episode.length}'),
                    // const episode_widget.EpisodeWidget(),
                    FutureBuilder<List<Episode>>(
                        future: futureEpisodes,
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                          for (var episode in snapshot.data) {
                            if (episode.characters.contains(character.url)) {
                              print('Episode : ${episode.name} ');
                              return Text('Episode : ${episode.name}, ${episode.episode} - Date de sortie : ${episode.airDate} - Nombre de personnages : ${episode.characters.length} - ');
                            }}
                         } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }),
                    buildText('Url : ${character.url}'),
                    buildText('Prix : ${character.price} BTC'),
                  ],
                ),
              ),
              const ButtonBuy(),
              ElevatedButton(
                  onPressed: (() => goBack(context)),
                  child: const Text('Go Back')),
            ]),
      ),
    );
  }

  Widget buildText(text) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
    child: Text(text),
  );

  void goBack(context) {
    Navigator.pop(context);
  }
}

// class DetailsPage extends StatelessWidget {
//   final Character character;
//
//   const DetailsPage({super.key, required this.character});
// }

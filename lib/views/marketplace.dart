import 'package:flutter/material.dart';
import '../model/character.dart';
import '../rick_and_morty_api.dart';
import 'details_page.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({
    super.key,
    required this.title,
  });

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
      body: RefreshIndicator(
        onRefresh: () async {
          var characters = await RickAndMortyApiState().getCharacters();
          setState(() {
            futureCharacters = Future.value(characters);
          });
        },
        child: Padding(
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
                                buildListTile(character, context),
                                buildImageSizedBox(character),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildColumnForPositionAndOrigin(
                                              character, context),
                                          buildColumnForStatusAndRarity(
                                              character, context),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          buildColumnForPrice(character, context),
                                          buildColumnForBuyButton(context),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
      ),
    );
  }

  Column buildColumnForStatusAndRarity(
      Character character, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: createStatusColor(character.status),
              radius: 5,
            ),
            const SizedBox(width: 8),
            Text(
              '${character.status.name} - ${character.species.name}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Chip(
              label: Text(createRarityText(character.rarity),
                  style: Theme.of(context).textTheme.headlineSmall),
              backgroundColor: createRarityColor(character.rarity),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildColumnForPositionAndOrigin(
      Character character, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dernière position connue',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          character.location.name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black54),
        ),
        const SizedBox(height: 10),
        Text(
          'Planet d\'origine',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          character.origin.name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black54),
        ),
      ],
    );
  }

  Column buildColumnForBuyButton(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {/* ... */},
              child: Text(
                'ACHETER',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.primary)
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column buildColumnForPrice(Character character, BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.currency_bitcoin_rounded,
              size: 18,
            ),
            Text(
              createPrice(character.price, character.id).toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox buildImageSizedBox(Character character) {
    return SizedBox(
      child: Image.network(
        character.image,
        fit: BoxFit.cover,
        width: double.maxFinite,
        height: 250,
      ),
    );
  }

  ListTile buildListTile(Character character, BuildContext context) {
    return ListTile(
      title: Text(
        character.name,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(character.type),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: (() => {openPage(context, character)}),
    );
  }

  void openPage(context, character) {
    print('test');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(character: character)));
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

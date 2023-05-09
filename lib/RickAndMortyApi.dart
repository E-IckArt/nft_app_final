import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class RickAndMortyApi extends StatefulWidget {
  const RickAndMortyApi({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<RickAndMortyApi> createState() => _RickAndMortyApiState();
}

class _RickAndMortyApiState extends State<RickAndMortyApi> {

_getCharacters() {
  setState(() {

  });
}

Future<http.Response> getCharacters() async {
  var response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
  print(response.body);
  return response;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            MaterialButton(
              onPressed: () => { getCharacters() },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              textColor: Colors.white,
              color: Colors.tealAccent[400],
              height: 36,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Text(
                  'API CALL',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
            )
        ],
      )
      ),
    );
  }
}

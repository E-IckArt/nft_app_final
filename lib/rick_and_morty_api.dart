import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:nft_app_final/model/character.dart';

class RickAndMortyApiState {
  Future<List<Character>> getCharacters() async {
    var url = 'https://rickandmortyapi.com/api/character';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final List<Character> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(Character.fromJson(entry));
      }

      return list;
    } else {
      throw Exception('Failed to load Characters list');
    }
  }
}

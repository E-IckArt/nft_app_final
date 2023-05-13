import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:nft_app_final/model/episode.dart';

class EpisodeApiState {
  Future<List<Episode>> getEpisodes() async {
    var url = 'https://rickandmortyapi.com/api/episode';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final List<Episode> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(Episode.fromJson(entry));
      }

      return list;
    } else {
      throw Exception('Failed to load Episodes list');
    }
  }
}
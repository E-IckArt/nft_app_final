// To parse this JSON data, do
//
//     final charactersResponse = charactersResponseFromJson(jsonString);

import 'dart:convert';

CharactersResponse charactersResponseFromJson(String str) => CharactersResponse.fromJson(json.decode(str));

String charactersResponseToJson(CharactersResponse data) => json.encode(data.toJson());

class CharactersResponse {
  Info info;
  List<Character> characters;

  CharactersResponse({
    required this.info,
    required this.characters,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) => CharactersResponse(
    info: Info.fromJson(json["info"]),
    characters: List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "characters": List<dynamic>.from(characters.map((x) => x.toJson())),
  };
}

class Character {
  int id;
  String name;
  Status status;
  Species species;
  String type;
  Gender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Rarity rarity;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,

    required this.rarity,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json["id"],
    name: json["name"],
    status: statusValues.map[json["status"]]!,
    species: speciesValues.map[json["species"]]!,
    type: json["type"],
    gender: genderValues.map[json["gender"]]!,
    origin: Location.fromJson(json["origin"]),
    location: Location.fromJson(json["location"]),
    image: json["image"],
    episode: List<String>.from(json["episode"].map((x) => x)),
    url: json["url"],
    created: DateTime.parse(json["created"]),

    rarity: rarityValues.map[json["rarity"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": statusValues.reverse[status],
    "species": speciesValues.reverse[species],
    "type": type,
    "gender": genderValues.reverse[gender],
    "origin": origin.toJson(),
    "location": location.toJson(),
    "image": image,
    "episode": List<dynamic>.from(episode.map((x) => x)),
    "url": url,
    "created": created.toIso8601String(),

    "rarity": rarityValues.reverse[rarity],
  };
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE,
  "unknown": Gender.UNKNOWN
});

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

enum Species { HUMAN, ALIEN }

final speciesValues = EnumValues({
  "Alien": Species.ALIEN,
  "Human": Species.HUMAN
});

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues({
  "Alive": Status.ALIVE,
  "Dead": Status.DEAD,
  "unknown": Status.UNKNOWN
});

enum Rarity { RARE, COMMUN, UNKNOWN }

final rarityValues = EnumValues({
  "Rare": Rarity.RARE,
  "Commun": Rarity.COMMUN,
  "unknown": Rarity.UNKNOWN
});

class Info {
  int count;
  int pages;
  String next;
  dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    count: json["count"],
    pages: json["pages"],
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "pages": pages,
    "next": next,
    "prev": prev,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

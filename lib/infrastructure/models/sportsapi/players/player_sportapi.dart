class PlayerSportapi {
  final int id;
  final String? name;
  final String? number;
  final String? country;
  final Position? position;
  final int? age;

  PlayerSportapi({
    required this.id,
    required this.name,
    required this.number,
    required this.country,
    required this.position,
    required this.age,
  });

  factory PlayerSportapi.fromJson(Map<String, dynamic> json) => PlayerSportapi(
        id: json["id"],
        name: json["name"] ?? 'No name',
        number: json["number"] ?? 'No number',
        country: json["country"] ?? 'No country ',
        position: positionValues.map[json["position"] ?? 'No position'],
        age: json["age"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "country": country,
        "position": positionValues.reverse[position],
        "age": age,
      };
}

enum Position { CENTER, FORWARD, GUARD }

final positionValues = EnumValues({
  "Center": Position.CENTER,
  "Forward": Position.FORWARD,
  "Guard": Position.GUARD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class TeamSportapi {
  final int id;
  final String name;
  final String logo;
  final bool nationnal;
  final Country country;

  TeamSportapi({
    required this.id,
    required this.name,
    required this.logo,
    required this.nationnal,
    required this.country,
  });

  factory TeamSportapi.fromJson(Map<String, dynamic> json) => TeamSportapi(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        nationnal: json["nationnal"] ?? '',
        country: Country.fromJson(json["country"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "nationnal": nationnal,
        "country": country.toJson(),
      };
}

class Country {
  final int id;
  final String name;
  final String code;
  final String flag;

  Country({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "flag": flag,
      };
}

class StatisticsSportapi {
  final Country country;
  final League league;
  final Team team;
  final Games games;
  final Points points;

  StatisticsSportapi({
    required this.country,
    required this.league,
    required this.team,
    required this.games,
    required this.points,
  });

  factory StatisticsSportapi.fromJson(Map<String, dynamic> json) =>
      StatisticsSportapi(
        country: Country.fromJson(json["country"]),
        league: League.fromJson(json["league"]),
        team: Team.fromJson(json["team"]),
        games: Games.fromJson(json["games"]),
        points: Points.fromJson(json["points"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country.toJson(),
        "league": league.toJson(),
        "team": team.toJson(),
        "games": games.toJson(),
        "points": points.toJson(),
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

class Games {
  final Played played;
  final Draws wins;
  final Draws draws;
  final Draws loses;

  Games({
    required this.played,
    required this.wins,
    required this.draws,
    required this.loses,
  });

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        played: Played.fromJson(json["played"]),
        wins: Draws.fromJson(json["wins"]),
        draws: Draws.fromJson(json["draws"]),
        loses: Draws.fromJson(json["loses"]),
      );

  Map<String, dynamic> toJson() => {
        "played": played.toJson(),
        "wins": wins.toJson(),
        "draws": draws.toJson(),
        "loses": loses.toJson(),
      };
}

class Draws {
  final All home;
  final All away;
  final All all;

  Draws({
    required this.home,
    required this.away,
    required this.all,
  });

  factory Draws.fromJson(Map<String, dynamic> json) => Draws(
        home: All.fromJson(json["home"]),
        away: All.fromJson(json["away"]),
        all: All.fromJson(json["all"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home.toJson(),
        "away": away.toJson(),
        "all": all.toJson(),
      };
}

class All {
  final int total;
  final String percentage;

  All({
    required this.total,
    required this.percentage,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
        total: json["total"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "percentage": percentage,
      };
}

class Played {
  final int home;
  final int away;
  final int all;

  Played({
    required this.home,
    required this.away,
    required this.all,
  });

  factory Played.fromJson(Map<String, dynamic> json) => Played(
        home: json["home"],
        away: json["away"],
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "all": all,
      };
}

class League {
  final int id;
  final String name;
  final String type;
  final String season;
  final String logo;

  League({
    required this.id,
    required this.name,
    required this.type,
    required this.season,
    required this.logo,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        season: json["season"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "season": season,
        "logo": logo,
      };
}

class Points {
  final Against pointsFor;
  final Against against;

  Points({
    required this.pointsFor,
    required this.against,
  });

  factory Points.fromJson(Map<String, dynamic> json) => Points(
        pointsFor: Against.fromJson(json["for"]),
        against: Against.fromJson(json["against"]),
      );

  Map<String, dynamic> toJson() => {
        "for": pointsFor.toJson(),
        "against": against.toJson(),
      };
}

class Against {
  final Played total;
  final Average average;

  Against({
    required this.total,
    required this.average,
  });

  factory Against.fromJson(Map<String, dynamic> json) => Against(
        total: Played.fromJson(json["total"]),
        average: Average.fromJson(json["average"]),
      );

  Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "average": average.toJson(),
      };
}

class Average {
  final String home;
  final String away;
  final String all;

  Average({
    required this.home,
    required this.away,
    required this.all,
  });

  factory Average.fromJson(Map<String, dynamic> json) => Average(
        home: json["home"],
        away: json["away"],
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "all": all,
      };
}

class Team {
  final int id;
  final String name;
  final String logo;

  Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
      };
}

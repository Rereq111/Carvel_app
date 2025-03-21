import 'package:carvel_app/infrastructure/models/sportsapi/players/player_sportapi.dart';

class SportsApiResponse {
  final String sportsApiResponseGet;
  final Parameters parameters;
  final List<dynamic> errors;
  final int results;
  final List<PlayerSportapi> response;

  SportsApiResponse({
    required this.sportsApiResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });

  factory SportsApiResponse.fromJson(Map<String, dynamic> json) =>
      SportsApiResponse(
        sportsApiResponseGet: json["get"] ?? '',
        parameters: Parameters.fromJson(json["parameters"] ?? {}),
        errors: json["errors"] is Map
            ? json["errors"].entries.map((e) => e.value).toList()
            : json["errors"] is List
                ? List<dynamic>.from(json["errors"].map((x) => x))
                : [],
        results: json["results"] ?? 0,
        response: json["response"] is List
            ? List<PlayerSportapi>.from((json["response"] as List<dynamic>)
                .map((x) => PlayerSportapi.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "get": sportsApiResponseGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Parameters {
  final String team;
  final String season;

  Parameters({
    required this.team,
    required this.season,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        team: json["team"] ?? '',
        season: json["season"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "team": team,
        "season": season,
      };
}

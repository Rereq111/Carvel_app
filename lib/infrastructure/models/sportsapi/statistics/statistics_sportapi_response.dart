import 'package:carvel_app/infrastructure/models/sportsapi/statistics/statistics_sportapi.dart';

class StatisticsSportsApiResponse {
  final String statisticsSportsApiResponseGet;
  final Parameters parameters;
  final List<dynamic> errors;
  final int results;
  final StatisticsSportapi response;

  StatisticsSportsApiResponse({
    required this.statisticsSportsApiResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });

  factory StatisticsSportsApiResponse.fromJson(Map<String, dynamic> json) =>
      StatisticsSportsApiResponse(
        statisticsSportsApiResponseGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: StatisticsSportapi.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "get": statisticsSportsApiResponseGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": response.toJson(),
      };
}

class Parameters {
  final String league;
  final String team;
  final String season;

  Parameters({
    required this.league,
    required this.team,
    required this.season,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        league: json["league"],
        team: json["team"],
        season: json["season"],
      );

  Map<String, dynamic> toJson() => {
        "league": league,
        "team": team,
        "season": season,
      };
}

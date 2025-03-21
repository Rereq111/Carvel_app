import 'package:carvel_app/infrastructure/models/sportsapi/teams/team_sportapi.dart';

class TeamsSportsApiResponse {
  final String teamsSportsApiResponseGet;
  final Parameters parameters;
  final List<dynamic> errors;
  final int results;
  final List<TeamSportapi> response;

  TeamsSportsApiResponse({
    required this.teamsSportsApiResponseGet,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.response,
  });

  factory TeamsSportsApiResponse.fromJson(Map<String, dynamic> json) =>
      TeamsSportsApiResponse(
        teamsSportsApiResponseGet: json["get"] ?? '',
        parameters: Parameters.fromJson(json["parameters"] ?? {}),
        // Si `errors` es un mapa, lo convierte a lista usando `entries.map`
        errors: json["errors"] is Map
            ? json["errors"].entries.map((e) => e.value).toList()
            : json["errors"] is List
                ? List<dynamic>.from(json["errors"].map((x) => x))
                : [],
        results: json["results"] ?? 0,
        // Si `response` es nulo o mapa, maneja correctamente el valor
        response: json["response"] != null
            ? List<TeamSportapi>.from((json["response"] as List<dynamic>)
                .map((x) => TeamSportapi.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "get": teamsSportsApiResponseGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Parameters {
  final String name;

  Parameters({
    required this.name,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

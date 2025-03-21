import '../../domain/datasources/players_datasource.dart';
import '../../domain/entities/statistics.dart';
import '../../domain/entities/team.dart';
import '../mappers/player_mapper.dart';
import '../mappers/statistic_mapper.dart';
import '../mappers/team_mapper.dart';
import '../models/sportsapi/players/sportsapi_response.dart';
import '../models/sportsapi/teams/team_sportapi_response.dart';
import 'package:carvel_app/config/constants/environment.dart';
import 'package:carvel_app/domain/entities/player.dart';
import 'package:dio/dio.dart';

class SportsapiDatasource extends PlayersDatasource {
  final dio = Dio(
      BaseOptions(baseUrl: 'https://v1.basketball.api-sports.io/', headers: {
    'x-rapidapi-key': Environment.sportApiKey, // API key
    'x-rapidapi-host': 'v1.basketball.api-sports.io', // Host (si es necesario)
  }));

  @override
  Future<List<Player>> getActualPlayers({int page = 1}) async {
    final response = await dio.get('players?team=139&season=2022-2023');

    final sportsApiResponse = SportsApiResponse.fromJson(response.data);

    final List<Player> player = sportsApiResponse.response
        .map(
            (sportsApiPlayer) => PlayerMapper.sportApiToEntity(sportsApiPlayer))
        .toList();
    return player;
  }

  @override
  Future<List<Team>> getActualTeam({int page = 1}) async {
    final responseteam = await dio.get('teams?name=Denver Nuggets');
    final sportsApiTeamResponse =
        TeamsSportsApiResponse.fromJson(responseteam.data);
    final List<Team> team = sportsApiTeamResponse.response
        .map((sportApiTeam) => TeamMapper.sportApiTeamToEntity(sportApiTeam))
        .toList();
    return team;
  }

  @override
  Future<Statistics> getStatistics({int page = 1}) async {
    final responsestatistic =
        await dio.get('statistics?league=12&team=139&season=2022-2023');

    final Statistics statistics = StatisticMapper.sportApiStatisticsToEntity(
      responsestatistic.data['response'] as Map<String, dynamic>,
    );

    return statistics;
  }
}

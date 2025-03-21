import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/domain/entities/statistics.dart';
import 'package:carvel_app/domain/entities/team.dart';

abstract class PlayersDatasource {
  Future<List<Player>> getActualPlayers({int page = 1});
  Future<List<Team>> getActualTeam({int page = 1});
  Future<Statistics> getStatistics({int page = 1});
}

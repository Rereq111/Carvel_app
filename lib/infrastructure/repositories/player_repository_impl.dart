import 'package:carvel_app/domain/datasources/players_datasource.dart';
import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/domain/entities/statistics.dart';
import 'package:carvel_app/domain/entities/team.dart';
import 'package:carvel_app/domain/respositories/players_repository.dart';

class PlayerRepositoryImpl extends PlayersRepository {
  final PlayersDatasource datasource;

  PlayerRepositoryImpl(this.datasource);

  @override
  Future<List<Player>> getActualPlayer({int page = 1}) {
    return this.datasource.getActualPlayers(page: page);
  }

  @override
  Future<List<Team>> getActualTeam({int page = 1}) {
    return this.datasource.getActualTeam(page: page);
  }

  @override
  Future<Statistics> getStatistics({int page = 1}) {
    return this.datasource.getStatistics(page: page);
  }
}

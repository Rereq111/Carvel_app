import 'package:carvel_app/domain/entities/team.dart';
import 'package:carvel_app/infrastructure/models/sportsapi/teams/team_sportapi.dart';

class TeamMapper {
  static Team sportApiTeamToEntity(TeamSportapi sportApiTeam) =>
      Team(name: sportApiTeam.name, logo: sportApiTeam.logo);
}

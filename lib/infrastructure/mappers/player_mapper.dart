import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/infrastructure/models/sportsapi/players/player_sportapi.dart';

class PlayerMapper {
  static Player sportApiToEntity(PlayerSportapi playerSportapi) => Player(
      name: playerSportapi.name,
      number: playerSportapi.number,
      country: playerSportapi.country,
      position: playerSportapi.position != null
          ? positionValues.reverse[playerSportapi.position]
          : null,
      age: playerSportapi.age);
}

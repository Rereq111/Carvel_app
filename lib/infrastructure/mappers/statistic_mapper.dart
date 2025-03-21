import 'package:carvel_app/domain/entities/statistics.dart';

class StatisticMapper {
  static Statistics sportApiStatisticsToEntity(Map<String, dynamic> data) {
    return Statistics(
      gamesPlayedHome: data['games']['played']['home'] ?? 0,
      gamesPlayedAway: data['games']['played']['away'] ?? 0,
      gamesPlayedAll: data['games']['played']['all'] ?? 0,
      totalWinsHome: data['games']['wins']['home']['total'] ?? 0,
      totalWinsAway: data['games']['wins']['away']['total'] ?? 0,
      totalWinsAll: data['games']['wins']['all']['total'] ?? 0,
      totalDrawsHome: data['games']['draws']['home']['total'] ?? 0,
      totalDrawsAway: data['games']['draws']['away']['total'] ?? 0,
      totalDrawsAll: data['games']['draws']['all']['total'] ?? 0,
      totalLosesHome: data['games']['loses']['home']['total'] ?? 0,
      totalLosesAway: data['games']['loses']['away']['total'] ?? 0,
      totalLosesAll: data['games']['loses']['all']['total'] ?? 0,
      teamName: '',
    );
  }
}

class Statistics {
  final String teamName;
  final int gamesPlayedHome;
  final int gamesPlayedAway;
  final int gamesPlayedAll;

  final int totalWinsHome;
  final int totalWinsAway;
  final int totalWinsAll;

  final int totalDrawsHome;
  final int totalDrawsAway;
  final int totalDrawsAll;

  final int totalLosesHome;
  final int totalLosesAway;
  final int totalLosesAll;

  Statistics({
    required this.teamName,
    required this.gamesPlayedHome,
    required this.gamesPlayedAway,
    required this.gamesPlayedAll,
    required this.totalWinsHome,
    required this.totalWinsAway,
    required this.totalWinsAll,
    required this.totalDrawsHome,
    required this.totalDrawsAway,
    required this.totalDrawsAll,
    required this.totalLosesHome,
    required this.totalLosesAway,
    required this.totalLosesAll,
  });
}

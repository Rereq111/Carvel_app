import 'package:carvel_app/domain/entities/team.dart';
import 'package:carvel_app/presentation/providers/teams/team_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actualTeamsProvider =
    StateNotifierProvider<TeamsNotifier, List<Team>>((ref) {
  final fetchMoreTeams = ref.watch(teamRepositoryProvider).getActualTeam;

  return TeamsNotifier(fetchMoreTeams: fetchMoreTeams);
});

typedef TeamsCallBack = Future<List<Team>> Function({int page});

class TeamsNotifier extends StateNotifier<List<Team>> {
  int currentPage = 0;
  TeamsCallBack fetchMoreTeams;

  TeamsNotifier({required this.fetchMoreTeams}) : super([]);

  Future<void> loadNextTeamPage() async {
    currentPage++;

    final List<Team> teams = await fetchMoreTeams(page: currentPage);
    state = [...state, ...teams];
  }
}

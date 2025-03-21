import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/presentation/providers/players/players_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actualPlayersProvider =
    StateNotifierProvider<PlayersNotifier, List<Player>>((ref) {
  final fetchMorePlayers = ref.watch(playerRepositoryProvider).getActualPlayer;

  return PlayersNotifier(fetchMorePlayers: fetchMorePlayers);
});

typedef PlayersCallBack = Future<List<Player>> Function({int page});

class PlayersNotifier extends StateNotifier<List<Player>> {
  int currentPage = 0;
  PlayersCallBack fetchMorePlayers;

  PlayersNotifier({required this.fetchMorePlayers}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Player> players = await fetchMorePlayers(page: currentPage);
    state = [...state, ...players];
  }
}

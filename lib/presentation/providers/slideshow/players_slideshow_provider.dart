import 'package:carvel_app/domain/entities/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../players/players_providers.dart';

final playersSlideshowProvider = Provider<List<Player>>(
  (ref) {
    final actualPlayer = ref.watch(actualPlayersProvider);

    if (actualPlayer.isEmpty) return [];
    return actualPlayer.toSet().toList();
  },
);

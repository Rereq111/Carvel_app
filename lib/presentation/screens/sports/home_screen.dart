import 'package:carvel_app/presentation/providers/providers.dart';
import 'package:carvel_app/presentation/widgets/players/players_slideshow.dart';
import 'package:carvel_app/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _Homeview());
  }
}

class _Homeview extends ConsumerStatefulWidget {
  const _Homeview();

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends ConsumerState<_Homeview> {
  @override
  void initState() {
    super.initState();
    ref.read(actualPlayersProvider.notifier).loadNextPage();
    ref.read(actualTeamsProvider.notifier).loadNextTeamPage();
  }

  @override
  Widget build(BuildContext context) {
    final slidePlayers = ref.watch(playersSlideshowProvider);
    final slideTeam = ref.watch(actualTeamsProvider);
    if (slidePlayers.isEmpty)
      return Center(child: const CircularProgressIndicator());

    return Column(
      children: [
        const CustomAppbar(),
        PlayerSlideShow(
          players: slidePlayers,
          teams: slideTeam,
        )
        //
      ],
    );
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:carvel_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'player_slide.dart';
import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/domain/entities/team.dart';

class PlayerSlideShow extends StatefulWidget {
  final List<Player> players;
  final List<Team> teams;

  const PlayerSlideShow({
    super.key,
    required this.players,
    required this.teams,
  });

  @override
  State<PlayerSlideShow> createState() => _PlayerSlideShowState();
}

class _PlayerSlideShowState extends State<PlayerSlideShow> {
  int _activeIndex = 0; // 👈 Estado para almacenar el índice activo

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final double cardHeight = MediaQuery.of(context).size.height * 0.7;

    return Column(
      children: [
        if (widget.teams.isNotEmpty)
          Column(
            children: [
              SizedBox(
                height: cardHeight,
                width: double.infinity,
                child: Swiper(
                  viewportFraction: 0.8,
                  scale: 0.9,
                  autoplay: true,
                  itemCount: widget.players.length,
                  onIndexChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => PlayerSlide(
                    player: widget.players[index],
                    team: widget.teams.first,
                    cardHeight: cardHeight,
                  ),
                ),
              ),
              _buildCustomPagination(
                  widget.players.length, colors, _activeIndex),
            ],
          ),
        const SizedBox(height: 16),
        FilledButton.tonal(
          onPressed: () => context.pushNamed(StatisticsScreen.name),
          child: const Text('Detalles'),
        ),
      ],
    );
  }

  Widget _buildCustomPagination(
      int itemCount, ColorScheme colors, int activeIndex) {
    int totalIndicators = itemCount > 6 ? 6 : itemCount;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalIndicators, (index) {
          bool isActive = index == activeIndex % totalIndicators;

          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 12 : 8,
            height: isActive ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? colors.primary : colors.secondary,
            ),
          );
        }),
      ),
    );
  }
}

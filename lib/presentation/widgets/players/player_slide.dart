import 'package:carvel_app/domain/entities/player.dart';
import 'package:carvel_app/domain/entities/team.dart';
import 'package:flutter/material.dart';
import 'team_logo.dart';

class PlayerSlide extends StatelessWidget {
  final Player player;
  final Team team;
  final double cardHeight;

  const PlayerSlide({
    super.key,
    required this.player,
    required this.team,
    required this.cardHeight,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Logo del equipo
              TeamLogo(
                teamName: team.name,
                height: cardHeight * 0.6,
              ),

              // Datos del jugador
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name ?? 'No name',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Posición: ${player.position}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Edad: ${player.age}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'País: ${player.country}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

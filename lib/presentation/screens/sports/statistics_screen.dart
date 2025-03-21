import 'package:carvel_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatisticsScreen extends StatelessWidget {
  static const name = 'statistics_screen';

  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(title: const Text('Estadísticas del Equipo')),
        body: const _StatisticsScreen());
  }
}

class _StatisticsScreen extends ConsumerStatefulWidget {
  const _StatisticsScreen();

  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends ConsumerState<_StatisticsScreen> {
  @override
  void initState() {
    super.initState();
    // Disparar solicitud de datos
    ref.read(statisticsProvider.notifier).loadStatistics();
  }

  @override
  Widget build(BuildContext context) {
    final statistics = ref.watch(statisticsProvider);
    if (statistics == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Categoría')),
            DataColumn(label: Text('Casa')),
            DataColumn(label: Text('Visita')),
            DataColumn(label: Text('Total')),
          ],
          rows: [
            _buildDataRow('Juegos Jugados', statistics.gamesPlayedHome,
                statistics.gamesPlayedAway, statistics.gamesPlayedAll),
            _buildDataRow('Victorias', statistics.totalWinsHome,
                statistics.totalWinsAway, statistics.totalWinsAll),
            _buildDataRow('Empates', statistics.totalDrawsHome,
                statistics.totalDrawsAway, statistics.totalDrawsAll),
            _buildDataRow('Derrotas', statistics.totalLosesHome,
                statistics.totalLosesAway, statistics.totalLosesAll),
          ],
        ),
      ),
    );
  }
}

DataRow _buildDataRow(String label, int home, int away, int total) {
  return DataRow(cells: [
    DataCell(Text(label)),
    DataCell(Text(home.toString())),
    DataCell(Text(away.toString())),
    DataCell(Text(total.toString())),
  ]);
}

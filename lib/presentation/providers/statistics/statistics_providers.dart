import 'package:carvel_app/domain/entities/statistics.dart';
import 'package:carvel_app/presentation/providers/statistics/statistics_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, Statistics?>((ref) {
  final fetchStatistics = ref.watch(statisticsRepositoryProvider).getStatistics;
  return StatisticsNotifier(fetchStatistics: fetchStatistics);
});

typedef StatisticsCallBack = Future<Statistics> Function();

class StatisticsNotifier extends StateNotifier<Statistics?> {
  final StatisticsCallBack fetchStatistics;

  StatisticsNotifier({required this.fetchStatistics}) : super(null);

  Future<void> loadStatistics() async {
    try {
      final statistics = await fetchStatistics();
      state = statistics;
    } catch (e) {
      print('Error loading statistics: $e');
    }
  }
}

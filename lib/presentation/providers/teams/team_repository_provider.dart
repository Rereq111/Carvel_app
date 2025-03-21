import 'package:carvel_app/infrastructure/datasource/sportsapi_datasource.dart';
import 'package:carvel_app/infrastructure/repositories/player_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final teamRepositoryProvider = Provider((ref) {
  return PlayerRepositoryImpl(SportsapiDatasource());
});

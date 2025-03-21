import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String sportApiKey = dotenv.env['API_SPORTS'] ?? 'no hay api key';
}

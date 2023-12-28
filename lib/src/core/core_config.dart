import 'package:flutter_dotenv/flutter_dotenv.dart';

class CoreConfiguration{
  static String? accessTokenAuth = dotenv.env['TOKEN_AUTH_API'];
}
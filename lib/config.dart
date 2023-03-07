import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  final String bundleIdentifier = 'com.solutionsitd.mobile';

  final String auth0Domain;
  final String auth0ClientId;

  Config({required this.auth0Domain, required this.auth0ClientId});
}

final config = Config(
  auth0ClientId: dotenv.env['AUTH0_CLIENT_ID']!,
  auth0Domain: dotenv.env['AUTH0_DOMAIN']!,
);

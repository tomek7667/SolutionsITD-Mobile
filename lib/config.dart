import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  final String bundleIdentifier = 'com.solutionsitd.mobile';
  final String auth0LoginRedirectUri =
      'com.solutionsitd.mobile://login-callback';
  final String auth0LogoutRedirectUri =
      'com.solutionsitd.mobile://logout-callback';
  late String auth0Issuer;

  final String auth0Domain;
  final String auth0ClientId;

  Config({required this.auth0Domain, required this.auth0ClientId}) {
    auth0Issuer = 'https://$auth0Domain';
  }
}

final config = Config(
  auth0ClientId: dotenv.env['AUTH0_CLIENT_ID']!,
  auth0Domain: dotenv.env['AUTH0_DOMAIN']!,
);

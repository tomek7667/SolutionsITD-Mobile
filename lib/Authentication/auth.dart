import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:solutions_itd_mobile/config.dart';
import 'package:solutions_itd_mobile/utils/alerts.dart';

class AuthAPI {
  late String a;

  static final Auth0 auth0 = Auth0(
    config.auth0Domain,
    config.auth0ClientId,
  );

  static Future<void> verify() async {}

  static Future<void> authenticate({
    required BuildContext loadingContext,
  }) async {
    try {
      showLoadingDialog(loadingContext);
      final credentials = await auth0.webAuthentication().login(
        redirectUrl: config.auth0LoginRedirectUri,
        scopes: {
          'openid',
          'profile',
          'email',
          'offline_access',
        },
      );
      print(credentials);

      // const appAuth = FlutterAppAuth();
      // final authorizationTokenRequest = AuthorizationTokenRequest(
      //   config.auth0ClientId,
      //   config.auth0RedirectUri,
      //   issuer: config.auth0Issuer,
      //   scopes: ['openid', 'profile', 'email', 'offline_access'],
      //   promptValues: ['login'],
      // );
      // final result = await appAuth.authorizeAndExchangeCode(
      //   authorizationTokenRequest,
      // );
      // result.
      // await appData.setUser(credentials.user);
      // await appData.setAccessToken(credentials.accessToken);
    } catch (e) {
      print("FAILED!!!");
      print(e);
    }
    hideLoadingDialog(loadingContext);
  }

  static Future<void> unauthenticate({
    required BuildContext loadingContext,
  }) async {
    try {
      showLoadingDialog(loadingContext);
      await auth0
          .webAuthentication()
          .logout(returnTo: config.auth0LogoutRedirectUri);
      // const appAuth = FlutterAppAuth();
      // final authorizationTokenRequest = AuthorizationTokenRequest(
      //   config.auth0ClientId,
      //   config.auth0RedirectUri,
      //   issuer: config.auth0Issuer,
      //   scopes: ['openid', 'profile', 'email', 'offline_access'],
      //   promptValues: ['login'],
      // );
      // final result = await appAuth.authorizeAndExchangeCode(
      //   authorizationTokenRequest,
      // );
      // result.
      // await appData.setUser(credentials.user);
      // await appData.setAccessToken(credentials.accessToken);
    } catch (e) {
      print("FAILED!!!");
      print(e);
    }
    hideLoadingDialog(loadingContext);
  }
}

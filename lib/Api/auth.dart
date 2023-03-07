// ignore_for_file: use_build_context_synchronously, empty_catches

import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:solutions_itd_mobile/utils/alerts.dart';
import 'package:solutions_itd_mobile/utils/app_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthAPI {
  final Auth0 auth0;

  AuthAPI({required this.auth0});

  Future<void> verify() async {
    await auth0.api.userProfile(accessToken: appData.accessToken!);
  }

  Future<void> authenticate({
    required BuildContext parentLoadingContext,
  }) async {
    try {
      showLoadingDialog(parentLoadingContext);
      final credentials = await auth0
          .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
          .login();
      await appData.setUser(credentials.user);
      await appData.setAccessToken(credentials.accessToken);
      showSuccessDialog(
        parentLoadingContext,
        AppLocalizations.of(parentLoadingContext)
            .mainPage_successfulAuthentication,
      );
    } catch (e) {}
    hideLoadingDialog(parentLoadingContext);
  }

  Future<void> unauthenticate({
    required BuildContext parentLoadingContext,
  }) async {
    try {
      showLoadingDialog(parentLoadingContext);
      await auth0
          .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
          .logout();
      await appData.clearUser();
      showSuccessDialog(
        parentLoadingContext,
        AppLocalizations.of(parentLoadingContext).mainPage_successfulLogout,
      );
    } catch (e) {}
    hideLoadingDialog(parentLoadingContext);
  }
}

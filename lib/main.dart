import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile/MainPage/connection_type_provider.dart';
import 'package:mobile/routers.dart';
import 'package:mobile/utils/app_colors.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ConnectionTypeProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: "Solutions ITD",
      theme: ThemeData(
        primarySwatch: createMaterialColor(AppColors.turquoise),
      ),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaleFactor;
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: scale,
          ),
          child: child ?? const Placeholder(),
        );
      },
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

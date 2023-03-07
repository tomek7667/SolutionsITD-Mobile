import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:solutions_itd_mobile/Api/auth.dart';
import 'package:solutions_itd_mobile/MainPage/connection_type_provider.dart';
import 'package:solutions_itd_mobile/MainPage/main_page_filter_provider.dart';
import 'package:solutions_itd_mobile/routers.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';
import 'package:solutions_itd_mobile/utils/app_data.dart';
import 'package:provider/provider.dart';

late AuthAPI authApi;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appData.initialize();
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectionTypeProvider()),
        ChangeNotifierProvider(create: (_) => MainPageProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  final Auth0? auth0;
  const MainApp({this.auth0, final Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    authApi = AuthAPI(
      auth0: widget.auth0 ??
          Auth0(
            dotenv.env['AUTH0_DOMAIN']!,
            dotenv.env['AUTH0_CLIENT_ID']!,
          ),
    );
  }

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

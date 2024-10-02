import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:leave_tracker/core/network/dio_singleton.dart';
import 'package:leave_tracker/core/resource/theme.dart';
import 'package:leave_tracker/core/utils/storage_manager.dart';
import 'package:leave_tracker/ui/home/presentation/screens/screen_home.dart';
import 'package:leave_tracker/ui/settings/presentation/blocs/settings_cubit.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';
import 'router/router.dart';

String apiKey = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (const String.fromEnvironment("API_KEY").isNotEmpty) {
    apiKey = const String.fromEnvironment("API_KEY");
  }else{
    try {
      await dotenv.load(fileName: ".env");
      apiKey = dotenv.env['API_KEY'] ?? "";
    }catch(e){
      throw UnsupportedError("dotenv file not found",);
    }
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(BlocProvider(
    create: (context) => SettingsCubit(),
    child: const OKToast(child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static FirebaseAnalyticsObserver firebaseObserver = FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

  @override
  void initState() {
    super.initState();
    DioSingleton.instance.create(apiKey);
    StorageManager.instance.create();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Leave_tracker',
      debugShowCheckedModeBanner: false,
      theme: MaterialTheme(createTextTheme(context, "Montserrat", "Montserrat")).light(),
      darkTheme: MaterialTheme(createTextTheme(context, "Montserrat", "Montserrat")).dark(),
      themeMode: context.watch<SettingsCubit>().state.theme,
      locale: Locale(context.watch<SettingsCubit>().state.languageCode),
      localizationsDelegates: [
        AppLocalizations.delegate,  // The generated localization delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('de'),
      ],
      routerConfig: GoRouter(
        navigatorKey: navigatorKey,
        observers: <NavigatorObserver>[routeObserver, firebaseObserver],
        initialLocation: ScreenHome.routeName,
        routes: routes,
      ),
    );
  }
}

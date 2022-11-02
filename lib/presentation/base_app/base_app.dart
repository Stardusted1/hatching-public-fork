import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hatching/core/blocs/app_bloc/app_bloc.dart';
import 'package:hatching/core/blocs/auth_cubit/auth_cubit.dart';
import 'package:hatching/data/repositories/analytics_repository/firebase_analytics_service.dart';
import 'package:hatching/data/repositories/test_repository/firebase_test_repository.dart';
import 'package:hatching/data/repositories/analytics_repository/analytics_repository.dart';
import 'package:hatching/data/repositories/test_repository/test_repository.dart';
import 'package:hatching/presentation/main_screen/main_screen.dart';
import 'package:hatching/utils/resourses.dart';
import 'package:hatching/utils/themes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [AppLocales.enLocale, AppLocales.uaLocale],
      path: 'assets/translations',
      useOnlyLangCode: true,
      fallbackLocale: AppLocales.enLocale,
      startLocale: AppLocales.enLocale,
      child: const BaseApp(),
    );
  }

  void _initDependencies() {
    Get.put<ITestsRepository>(FirebaseTestRepository());
    Get.put<IAnalyticsRepository>(FirebaseAnalyticsRepository());
  }
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hatching',
      localizationsDelegates: [
        EasyLocalization.of(context)!.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // supportedLocales: EasyLocalization.of(context)!.supportedLocales,
      // locale: EasyLocalization.of(context)!.locale,
      themeMode: ThemeMode.light,
      theme: AppThemes.getLightTheme(context),
      darkTheme: AppThemes.getDarkTheme(context),
      home: MultiBlocProvider(
        providers: _initBlocs(context),
        child: const MainScreen(),
      ),
    );
  }

  List<BlocProvider> _initBlocs(BuildContext context) {
    return [
      BlocProvider<AppBloc>(create: (_) => AppBloc()),
      BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
    ];
  }
}

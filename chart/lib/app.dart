import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:sof_tracker/app/data/binding.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/localization/l10n.dart';
import 'package:sof_tracker/app/global/styles/app_theme.dart';
import 'package:sof_tracker/app/global/utils/utils.dart';
import 'package:sof_tracker/app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(_) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: $r.theme.transparent,
        systemNavigationBarColor: $r.theme.white,
      ),
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, child) {
          return GetMaterialApp(
            //* Options
            useInheritedMediaQuery: true,
            theme: AppTheme.lightTheme(),
            title: $r.appName,
            navigatorKey: Get.key,
            transitionDuration: $r.times.pageTransition,
            debugShowCheckedModeBanner: false,
            builder: (_, widget) => ScrollConfiguration(behavior: GlobalScrollBehavior(), child: widget!),
            //* Localization
            locale: $r.defaultLocale,
            fallbackLocale: $r.alternativeLocale,
            localizationsDelegates: const [
              I10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: I10n.delegate.supportedLocales,
            localeResolutionCallback: (deviceLocale, supportedLocales) =>
                supportedLocales.map((e) => e.languageCode).contains(deviceLocale?.languageCode)
                    ? deviceLocale
                    : $r.defaultLocale,
            //* Routes
            getPages: AppPages.routes,
            initialRoute: AppPages.INITIAL,
            initialBinding: AppBinding(),
          );
        },
      ),
    );
  }
}

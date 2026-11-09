import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_themes.dart';
import 'package:news_app/core/utilities/routes/app_routes.dart';
import 'package:news_app/core/utilities/routes/app_routes_names.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        child: const NewsApp(),
      ),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilPlusInit(
      designSize: Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: AppRouteNames.splashScreen,
        themeMode: themeProvider.themeMode,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        builder: (context, widget) => Directionality(textDirection: .ltr, child: widget!) ,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/core/utilities/routes/app_routes_names.dart';
import 'package:news_app/modules/splash/screens/splash_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case AppRouteNames.splashScreen :
        return MaterialPageRoute(builder: (_) => SplashScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("there's an error"))),
        );
    }
  }
}

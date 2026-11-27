
import 'package:flutter/material.dart';
import 'package:news_app/core/utilities/routes/app_routes_names.dart';
import 'package:news_app/modules/main_layout/view/screens/main_layout_screen.dart';
import 'package:news_app/modules/main_layout/view_model/news_provider.dart';
import 'package:news_app/modules/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute( RouteSettings settings ) {
    switch (settings.name) {
      
      case AppRouteNames.splashScreen :
        return MaterialPageRoute(builder: (_) => SplashScreen());
      
      case AppRouteNames.mainLayoutScreen :
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (BuildContext context) => NewsProvider() ,
            child: MainLayoutScreen()
          )
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold( body: Center( child: Text( "there's an error" ) ) ) ,
        );
    }
  }
}

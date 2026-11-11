import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:news_app/core/utilities/routes/app_routes_names.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    final bool isLightMode = themeProvider.themeMode == ThemeMode.light ;
    return Scaffold(
      backgroundColor: isLightMode 
          ? AppColors.white 
          : AppColors.black ,
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 4,),
            FadeIn(
              duration: Duration( milliseconds: 500 ),
              child: SizedBox(
                width: 289.w,
                height: 289.h ,
                child: Image.asset(
                  AppImages.appLogo , 
                  color: isLightMode 
                      ? AppColors.black 
                      : AppColors.white ,
                  colorBlendMode: .srcIn ,
                ),
              ),
            ) ,
            Spacer(flex: 3,),
            FadeInUp(
              duration: Duration( milliseconds: 2000),
              onFinish: (direction) async {
                await Future.delayed( Duration(seconds: 1) ) ;
                if ( context.mounted ) {
                  Navigator.pushReplacementNamed( context , AppRouteNames.mainLayoutScreen ) ;
                }
              },
              child: SizedBox(
                width: 214.w,
                height: 85.13.h ,
                child: Image.asset(
                  AppImages.appBranding , 
                  color: isLightMode 
                      ? AppColors.black 
                      : AppColors.white ,
                  colorBlendMode: .srcIn ,
                ),
              ),
            ) ,
            SizedBox( height: 30.h ,) ,
          ],
        ),
      ),
    );
  }
}
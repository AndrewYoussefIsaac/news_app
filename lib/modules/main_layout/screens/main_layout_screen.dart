import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:provider/provider.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home".tr() ,
          style: AppFonts.medium20.copyWith(
            color: isLight 
                ? AppColors.black
                : AppColors.white ,
          ) ,
        ) ,
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric( horizontal: 16.w ),
            onPressed: (){} ,
            icon: SvgPicture.asset( 
              AppImages.search ,
              width:  24.sp ,
              height:  24.sp ,
              colorFilter :ColorFilter.mode(
                isLight 
                  ? AppColors.black
                  : AppColors.white , 
                  .srcIn 
                )
            ) ,
          ) , 
        ] ,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.black ,
        child: Column(
          spacing: 24.h ,
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0) ,
              padding: EdgeInsetsGeometry.zero,
              child: Container(
                  color: AppColors.white ,
                  child: Center(
                    child: Text(
                      "News App" ,
                      style: AppFonts.bold24.copyWith( color: AppColors.black ) ,
                    ),
                ),
              )
            ) ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                spacing: 16 ,
                children: [
                  SvgPicture.asset(
                    AppImages.home ,
                    width: 24.w ,
                    height: 24.h ,
                    colorFilter: ColorFilter.mode( AppColors.white , .srcIn ), 
                  ) ,
                  Text(
                    "go_to_home".tr() ,
                    style: AppFonts.bold24.copyWith( color: AppColors.white ) ,
                  )
                ],
              ),
            ) ,
            Divider(
              indent: 16.w ,
              endIndent: 16.w ,
            ) ,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                spacing: 16 ,
                children: [
                  SvgPicture.asset(
                    AppImages.theme ,
                    width: 24.w ,
                    height: 24.h ,
                    colorFilter: ColorFilter.mode( AppColors.white , .srcIn ), 
                  ) ,
                  Text(
                    "theme".tr() ,
                    style: AppFonts.bold24.copyWith( color: AppColors.white ) ,
                  )
                ],
              ),
            ) ,
          ],
        ) ,
      ),
    );
  }
}
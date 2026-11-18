import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:news_app/modules/main_layout/widgets/custom_dropdown_button.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onTap});
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    return Drawer(
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
            child: InkWell(
              onTap: onTap ,
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
          CustomDropdownButton(
            items: {
              ThemeMode.light : "light".tr() , 
              ThemeMode.dark : "dark".tr() , 
            } , 
            selectedValue: themeProvider.themeMode , 
            onChanged: (newValue){
              if ( newValue != null ) {
                themeProvider.setTheme( newValue as ThemeMode ) ;
              }
            } ,
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
                  "language".tr() ,
                  style: AppFonts.bold24.copyWith( color: AppColors.white ) ,
                )
              ],
            ),
          ) ,
          CustomDropdownButton(
            items: {
              Locale('en') : "English" , 
              Locale('ar') : "العربية" , 
            } , 
            selectedValue: context.locale ,
            onChanged: (newValue){
              if ( newValue != null ) {
                context.setLocale( newValue as Locale ) ;
              }
            } ,
          ) ,
        ],
      ) ,
    );
  }
}
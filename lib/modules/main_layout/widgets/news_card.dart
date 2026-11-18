import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:provider/provider.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 16.w ),
      child: Container(
        width: 361.w ,
        height: 322.h ,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color:  isLight 
                ? AppColors.black 
                : AppColors.white ,
                width: 1.7.sp 
          ) ,
          borderRadius: BorderRadius.circular(16.r) ,
        ),
        child: Column(
          crossAxisAlignment: .start ,
          children: [
            Image.asset( AppImages.mock , ), //// will change when using APIs
            SizedBox( height: 10.h ,) ,
            Text(
              "mock".tr() ,
              style: AppFonts.bold16 ,
              textDirection: context.locale == Locale("en")
                  ? .ltr 
                  : .rtl ,
                  maxLines: 2 ,
                  overflow: .ellipsis ,
            ) ,
            Spacer() ,
            Row(
              mainAxisAlignment: .spaceBetween ,
              children: [
                Text(
                  "By : Andrew Youssef" ,
                  style: AppFonts.medium14.copyWith( color: AppColors.grey ) ,
                ), 
                Text(
                  "1 minute ago" ,
                  style: AppFonts.medium14.copyWith( color: AppColors.grey ) ,
                ), 
              ],
            ) ,
          ],
        ),
      ),
    );
  }
}
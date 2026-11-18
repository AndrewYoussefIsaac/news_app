import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:provider/provider.dart';

class CustomCategoryCardButton extends StatelessWidget {
  const CustomCategoryCardButton({super.key, required this.isRight, required this.onTap});
  final bool isRight ;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return InkWell(
      onTap: onTap ,
      child: Container(
        width: 167.w ,
        height: 54.h ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(84.r) ,
          color: isLight 
              ? AppColors.white.withValues(alpha: 0.5) 
              : AppColors.black.withValues(alpha: 0.5) ,
        ),
        child: Row(
          textDirection: isRight
              ? .ltr
              : .rtl ,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: isRight 
                    ? 15.w 
                    : 0.w ,
                right: isRight 
                    ? 0.w 
                    : 15.w ,
              ),
              child: Text(
                "view_all".tr() ,
                style: AppFonts.medium24 ,
              ),
            ),
            Spacer() , 
            CircleAvatar(
              radius: 29.r ,
              backgroundColor: isLight 
              ? AppColors.white 
              : AppColors.black ,
              child: SvgPicture.asset(
                isRight 
                    ? AppImages.rightArrow 
                    : AppImages.leftArrow ,
                width: 24.w ,
                height: 24.h ,
                colorFilter: ColorFilter.mode(
                  isLight 
                      ? AppColors.black 
                      : AppColors.white , 
                  .srcIn 
                ) ,
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/view/widgets/custom_category_card_button.dart';
import 'package:provider/provider.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.categoryModel, required this.isRight, required this.onTap});
  final CategoryModel categoryModel ;
  final bool isRight ;
  final void Function(CategoryModel) onTap ;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return  Stack(
      children: [
        Container(
          height: 198.h ,
          width: .infinity ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular( 24.r ),
            image :DecorationImage(
              image:AssetImage(
                isLight 
                  ? categoryModel.darkImage
                  : categoryModel.image 
              ) ,
            ),
          ),
        ),
        Positioned(
          top: 30.h ,
          left: isRight
              ? null
              : 15.w ,
          right:  isRight
              ? 20.w
              : null  ,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text( 
                categoryModel.title.tr() ,
                style: AppFonts.medium35.copyWith(
                  color: isLight 
                      ? AppColors.white
                      : AppColors.black ,
                ) ,
              ) ,
              SizedBox( height: 40.h ,) ,
              CustomCategoryCardButton( 
                isRight: isRight , 
                onTap: (){
                  onTap(categoryModel) ;
                } ,
              ) ,
            ],
          ),
        ) ,
      ] ,
    );
  }
}
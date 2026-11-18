import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/widgets/categories_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onTap});
  final void Function(CategoryModel) onTap ;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric( horizontal: 16.w ),
        child: Column(
          crossAxisAlignment: context.locale == const Locale("en") 
              ? .start
              : .end ,
          children: [
            Text( 
              "home_welcome".tr() ,
              style: AppFonts.medium24 ,
              textDirection: context.locale == const Locale("en") 
                  ? .ltr
                  : .rtl ,
            ),
            SizedBox( height: 16.h , ) ,
            Expanded(
              child: ListView.separated(
                itemBuilder:(context, index) => CategoriesCard(
                  categoryModel: CategoryModel.categories[index],
                  isRight: index%2 == 0 ,
                  onTap: onTap ,
                ) , 
                separatorBuilder:(context, index) => SizedBox( height: 16.h , ) , 
                itemCount: CategoryModel.categories.length ,
              ),
            ) ,
          ],
        ),
      );
  }
}
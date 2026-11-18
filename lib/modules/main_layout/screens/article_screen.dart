import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/widgets/news_card.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.category});
  final CategoryModel? category;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return DefaultTabController(
      length: 8,
      child: Column(
        children: [
          TabBar(
            dividerColor: AppColors.transparent,
            tabAlignment: .start,
            isScrollable: true,
            indicatorColor: isLight ? AppColors.black : AppColors.white,
            labelStyle: AppFonts.bold16.copyWith(
              color: isLight ? AppColors.black : AppColors.white,
            ),
            unselectedLabelStyle: AppFonts.medium14.copyWith(
              color: isLight ? AppColors.black : AppColors.white,
            ),
            tabs: [
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
              Tab(text: "CBC"),
            ],
          ),
          SizedBox( height: 20.h,) ,
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => SizedBox( height: 20.h ,),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) => NewsCard() , 
            ),
          ),
        ],
      ),
    );
  }
}

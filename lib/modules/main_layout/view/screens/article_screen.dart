import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/view/widgets/news_card.dart';
import 'package:news_app/modules/main_layout/view_model/news_provider.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context)  {
    NewsProvider newsProvider = Provider.of<NewsProvider>( context ) ;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return switch ( newsProvider.sourceState ) {
      States.initial || States.loading  => Center(
            child: CircularProgressIndicator(
              color: isLight ? AppColors.black : AppColors.white,
            ),
          ) ,
      States.fail => Center(
          child: Text( newsProvider.sourceErrorMsg ?? "something went wrong" ),
        ) , 
      States.success => newsProvider.sources.isEmpty 
          ? Center(child: Text("No sources found")) 
          : DefaultTabController(
            length: newsProvider.sources.length ,
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
                  tabs: newsProvider.sources.map( (e) => Tab(text: e.name) ).toList(),
                  onTap: (index) => newsProvider.updateSelectedSource( newsProvider.sources[index].id ) ,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: switch ( newsProvider.newsState ) {
                    States.initial || States.loading => Center(
                      child: CircularProgressIndicator(
                        color: isLight ? AppColors.black : AppColors.white,
                      ),
                    ) ,
                    States.fail => Center(
                      child: Text( newsProvider.newsErrorMsg ?? "something went wrong ", ),
                    ) ,
                    States.success => ( newsProvider.news == null || newsProvider.news!.isEmpty )
                        ? Center(child: Text("No news found")) 
                        : ListView.separated(
                            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20.h),
                            itemCount: newsProvider.news!.length,
                            itemBuilder: (BuildContext context, int index) => NewsCard(article: newsProvider.news![index]),
                          )
                  }
                ),
              ],
            ),
          )
    } ;
  }
}

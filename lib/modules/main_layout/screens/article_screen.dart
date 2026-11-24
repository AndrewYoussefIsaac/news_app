import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/models/articles.dart';
import 'package:news_app/modules/main_layout/models/source_model.dart';
import 'package:news_app/modules/main_layout/services/api_service.dart';
import 'package:news_app/modules/main_layout/widgets/news_card.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.category});
  final CategoryModel? category;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  String? selectedSource;
  late Future<List<Source>> sources ;
  Future<List<Article>>? news ;

  @override
  void initState() {
    super.initState();
    sources = ApiService.getSources(widget.category!.id);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return FutureBuilder(
      future: sources,
      builder: (context, sourcesSnapshot) {
        if (sourcesSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: isLight ? AppColors.black : AppColors.white,
            ),
          );
        } else if (sourcesSnapshot.hasError) {
          return Center(
            child: Text("something went wrong\ntry again later ): "),
          );
        } else if (sourcesSnapshot.data == null || sourcesSnapshot.data!.isEmpty) {
          return Center(child: Text("No sources found"));
        } else {
          final sources = sourcesSnapshot.data!;
          if (selectedSource == null) {
            selectedSource = sources[0].id;
            news = ApiService.getNews(selectedSource!);
          }
          return DefaultTabController(
            length: sources.length ,
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
                  tabs: sources.map((e) => Tab(text: e.name)).toList(),
                  onTap: (index) {
                    if (selectedSource == sources[index].id) return;
                    setState(() {
                      selectedSource = sources[index].id;
                      news = ApiService.getNews(selectedSource!);
                    });
                  },
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: FutureBuilder(
                    future: news ,
                    builder: (context, newsSnapshot) {
                      if (newsSnapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: isLight ? AppColors.black : AppColors.white,
                          ),
                        );
                      } else if (newsSnapshot.hasError) {
                        return Center(
                          child: Text( "something went wrong\ntry again later ): ", ),
                        );
                      } else if ( newsSnapshot.data == null || newsSnapshot.data!.isEmpty ) {
                        return Center(child: Text("No news found"));
                      } else {
                        final articles = newsSnapshot.data!;
                        return ListView.separated(
                          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20.h),
                          itemCount: articles.length,
                          itemBuilder: (BuildContext context, int index) => NewsCard(article: articles[index]),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

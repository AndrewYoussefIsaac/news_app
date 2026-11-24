import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/modules/main_layout/models/articles.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool isLight = themeProvider.themeMode == ThemeMode.light;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 361.w,
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(
            color: isLight ? AppColors.black : AppColors.white,
            width: 1.7.sp,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, ////// as there's no given height  
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: double.infinity,
                height: 220.h,
                child:
                    (article.urlToImage == null || article.urlToImage!.isEmpty)
                    ? _imagePlaceholder(isLight)
                    : Image.network(
                        article.urlToImage!,
                        fit: BoxFit.cover,
                        // shown while the image is downloading
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              color: isLight
                                  ? AppColors.black
                                  : AppColors.white,
                            ),
                          );
                        },
                        // shown if the link is broken / blocked (404, 403, not an image...)
                        errorBuilder: (context, error, stackTrace) => _imagePlaceholder(isLight),
                      ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              article.title,
              style: AppFonts.bold16,
              textDirection: context.locale == Locale("en") ? .ltr : .rtl,
              maxLines: 2,
              overflow: .ellipsis,
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "By : ${article.author ?? article.source.name}",
                    style: AppFonts.medium14.copyWith(color: AppColors.grey),
                    maxLines: 1,
                    overflow: .ellipsis ,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  timeago.format(
                    article.publishedAt ,
                    locale: context.locale.languageCode ,
                  ),
                  style: AppFonts.medium14.copyWith(color: AppColors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _imagePlaceholder(bool isLight) {
    return Container(
      color: AppColors.grey.withValues(alpha: 0.2),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          size: 48.sp,
          color: isLight ? AppColors.black : AppColors.white,
        ),
      ),
    );
  }
}

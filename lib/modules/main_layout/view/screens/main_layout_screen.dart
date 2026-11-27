import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:news_app/modules/main_layout/view/screens/article_screen.dart';
import 'package:news_app/modules/main_layout/view/screens/home_screen.dart';
import 'package:news_app/modules/main_layout/view/widgets/custom_drawer.dart';
import 'package:news_app/modules/main_layout/view_model/news_provider.dart';
import 'package:provider/provider.dart';

class MainLayoutScreen extends StatelessWidget  {
  const MainLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsProvider newsProvider = Provider.of<NewsProvider>( context , listen: true ) ;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isLight 
            ? AppColors.white 
            :AppColors.black ,
        title: Text(
          newsProvider.selectedCategory == null 
              ? "home".tr()
              : newsProvider.selectedCategory!.title.tr() ,
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
      drawer: CustomDrawer( 
        onTap: () {
          newsProvider.goHome() ;
          Navigator.pop(context) ; // to auto close the drawer
        },
      ) ,
      body: newsProvider.selectedCategory == null 
          ? HomeScreen( onTap: newsProvider.updateSelectedCategory , )
          : ArticleScreen( ) ,
    );
  }

}

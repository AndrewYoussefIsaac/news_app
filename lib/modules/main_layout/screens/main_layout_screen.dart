import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utilities/app_colors.dart';
import 'package:news_app/core/utilities/app_fonts.dart';
import 'package:news_app/core/utilities/app_images.dart';
import 'package:news_app/modules/main_layout/screens/article_screen.dart';
import 'package:news_app/modules/main_layout/screens/home_screen.dart';
import 'package:news_app/modules/main_layout/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context) ;
    bool isLight = themeProvider.themeMode == ThemeMode.light ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isLight 
            ? AppColors.white 
            :AppColors.black ,
        title: Text(
          selectedCategory == null 
              ? "home".tr()
              : selectedCategory!.title.tr() ,
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
          selectedCategory = null ;
          setState(() { });
        },
      ) ,
      body: selectedCategory == null 
          ? HomeScreen(
            onTap: ( CategoryModel newCategory ) { 
              selectedCategory = newCategory ;
              setState(() {});
            },
          )
          : ArticleScreen( category: selectedCategory ,) ,
    );
  }
}
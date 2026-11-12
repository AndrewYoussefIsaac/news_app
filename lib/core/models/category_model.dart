import 'package:news_app/core/utilities/app_images.dart';

class CategoryModel {
  const CategoryModel({required this.id, required this.image, required this.title , required this.darkImage });
  final String id;
  final String image;
  final String darkImage;
  final String title;

  static const List<CategoryModel> categories = [
    CategoryModel(id: "general" , image: AppImages.general , title: "general" , darkImage: AppImages.darkGeneral ) ,
    CategoryModel(id: "business" , image: AppImages.business , title: "business", darkImage: AppImages.darkBusiness ) ,
    CategoryModel(id: "sports" , image: AppImages.sport , title: "sports", darkImage: AppImages.darkSport ) ,
    CategoryModel(id: "technology" , image: AppImages.technology , title: "technology", darkImage: AppImages.darkTechnology ) ,
    CategoryModel(id: "entertainment" , image: AppImages.entertainment , title: "entertainment", darkImage: AppImages.darkEntertainment ) ,
    CategoryModel(id: "health" , image: AppImages.helth , title: "health", darkImage: AppImages.darkHelth ) ,
    CategoryModel(id: "science" , image: AppImages.science , title: "science", darkImage: AppImages.darkScience ) ,
  ] ;
}

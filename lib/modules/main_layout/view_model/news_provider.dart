import 'package:flutter/widgets.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/modules/main_layout/model/models/articles.dart';
import 'package:news_app/modules/main_layout/model/models/source_model.dart';
import 'package:news_app/modules/main_layout/model/services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  
  CategoryModel? selectedCategory ;

  void goHome ( ) {
    selectedCategory = null ;
    selectedSource = null ;
    sources = [] ;
    news = [] ;
    newsState = States.initial ;
    sourceState = States.initial ;
    newsErrorMsg = null ;
    sourceErrorMsg = null ;
    notifyListeners() ;
  }

  void updateSelectedCategory( CategoryModel newCategory ){
    selectedCategory = newCategory ;
    getSources() ;
    notifyListeners() ;
  }


  String? selectedSource;
  late List<Source> sources ;
  List<Article>? news ;

  States sourceState  = States.initial ;
  States newsState  = States.initial ;
  String? sourceErrorMsg ;
  String? newsErrorMsg ;

  Future<void> getSources ( ) async {
    try {
      sourceState = States.loading ;
      newsState = States.loading ;
      notifyListeners() ;
      sources = await ApiService.getSources( selectedCategory!.id ) ;
      if ( sources.isNotEmpty ) {
        sourceState = States.success ;
        updateSelectedSource( sources[0].id ) ;
      } else {
        sourceState = States.fail ;
        newsState = States.fail ;
        notifyListeners() ;
      }
    } catch (e) {
      sourceState = States.fail ;
      newsState = States.fail ;
      sourceErrorMsg = e.toString() ;
      newsErrorMsg = "Try again later" ;
      notifyListeners() ;
    }
  }

  void updateSelectedSource ( String id ){
    if ( selectedSource == id ) return ;
    selectedSource = id ;
    newsErrorMsg = null ;
    getNews() ;
  }

  Future<void> getNews () async {
    try {
      newsState = States.loading ;
      notifyListeners() ;
      news = await ApiService.getNews( selectedSource! ) ;
      newsState = States.success ;
      notifyListeners() ;
    } catch (e) {
      newsState = States.fail ;
      newsErrorMsg = e.toString() ;
      notifyListeners() ;
    }
  }

}

enum States { initial , loading , success , fail }
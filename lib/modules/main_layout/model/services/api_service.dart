import 'package:dio/dio.dart';
import 'package:news_app/core/network/dio_service.dart';
import 'package:news_app/modules/main_layout/model/models/articles.dart';
import 'package:news_app/modules/main_layout/model/models/source_model.dart';

class ApiService {
  
  static Future<List<Article>> getNews ( String source ) async {
    try {
      var response = await DioService.dio.get(
        "everything" ,  // endpoint
        queryParameters: {  // querys 
          "sources" : source
        }
      ) ;
      if ( response.statusCode == 200 ) {  // successful connection
        NewsResponse newsResponse =  NewsResponse.fromJson( response.data ) ; // convert received JSON data to our model
        return newsResponse.articles ;
      } else {
        throw "something went wrong" ;
      }
    } on DioException catch(e){
      final data = e.response?.data;
      throw (data is Map ? data["message"] : null) ?? "something went wrong" ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future<List<Source>> getSources ( String category ) async {
    try {
      var response = await DioService.dio.get(
        "top-headlines/sources" ,  // endpoint
        queryParameters: {  // querys 
          "category" : category ,
        }
      ) ;
      if ( response.statusCode == 200 ) {  // successful connection
        SourceResponse sourceResponse =  SourceResponse.fromJson( response.data ) ; // convert received JSON data to our model
        return sourceResponse.sources ;
      } else {
        throw "something went wrong" ;
      }
    } on DioException catch(e){
      final data = e.response?.data;
      throw (data is Map ? data["message"] : null) ?? "something went wrong" ;
    } catch (e) {
      rethrow ;
    }
  }

}
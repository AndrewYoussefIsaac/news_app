import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env["BASE_URL"] ?? "" ,
      headers: {
        "X-Api-Key" : dotenv.env["API_KEY"] ,
      } ,
    )
  ) ;
}
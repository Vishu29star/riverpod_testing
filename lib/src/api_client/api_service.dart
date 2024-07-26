import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sample_project/src/models/news_response/news_api_response.dart';

import '../models/news_response/news_article.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: "https://newsapi.org/v2")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/top-headlines")
  Future<NewsApiResponse> getTopHeadlines(@Query("country") String country, @Query("apiKey") String apiKey);

  @GET("/everything")
  Future<NewsApiResponse> getEverything(@Query('q') String q, @Query('apiKey') String key);
}

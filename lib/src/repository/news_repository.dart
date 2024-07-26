import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_project/src/models/news_response/news_article.dart';
import 'package:sample_project/src/providers/repository_provider.dart';

import '../api_client/api_service.dart';
part 'news_repository.g.dart';
@riverpod
class NewsRepositoryAuto extends _$NewsRepositoryAuto{

  @override
  Future<Either<String, List<NewsArticle>>> build() async {
    // Return some initial data or perform an initial fetch
    return fetchTopHeadlines("us");
  }

  Future<Either<String, List<NewsArticle>>> fetchTopHeadlines(String country) async {
    try {
      final apiService = ref.read(apiServiceProvider);
      final newsApiKey = ref.read(newsApiKeyProvider);
      final newsApiResponse =  await apiService.getTopHeadlines(country, newsApiKey);
      return Right(newsApiResponse.articles);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String,List<NewsArticle>>> getEverything(String q) async {
    try{
      final apiService = ref.watch(apiServiceProvider);
      final newsApi = ref.watch(newsApiKeyProvider);
      final result = await apiService.getEverything(q, newsApi);
      return Right(result.articles);
    }catch(e){
      return Left(e.toString());
    }
  }
}


/*
class NewsRepository {
  final ApiService apiService;

  NewsRepository(this.apiService);

  Future<Either<String, List<NewsArticle>>> fetchTopHeadlines(String country, String apiKey) async {
    try {
      final newsApiResponse =  await apiService.getTopHeadlines(country, apiKey);
*//*      print("response");

      final articlesJson = response['articles'] as List;
      print("hnjmk,l");
      print(articlesJson);
      final newsArticle = articlesJson.map((json) => NewsArticle.fromJson(json)).toList();
      print("newsArticle");*//*
      print(newsApiResponse.articles.length);
      return Right(newsApiResponse.articles);
    } catch (e) {
      return Left(e.toString());
    }
  }
}*/

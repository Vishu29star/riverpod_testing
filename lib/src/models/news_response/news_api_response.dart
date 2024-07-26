import 'package:json_annotation/json_annotation.dart';
import 'news_article.dart';

part 'news_api_response.g.dart';

@JsonSerializable()
class NewsApiResponse {
  final String status;
  final int totalResults;
  final List<NewsArticle> articles;

  NewsApiResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsApiResponse.fromJson(Map<String, dynamic> json) => _$NewsApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsApiResponseToJson(this);
}

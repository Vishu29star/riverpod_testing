import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample_project/src/models/news_response/news_article.dart';

import '../providers/repository_provider.dart';
import '../repository/news_repository.dart';
part 'news_viewmodel.g.dart';

@riverpod
class AutoNewsModel extends _$AutoNewsModel {
  @override
  FutureOr<List<NewsArticle>> build(String country) async {
    country;
    return getTopHeadlines(country: country);
  }

  Future<List<NewsArticle>> getTopHeadlines({String? country}) async {

    state = const AsyncLoading();
    final repo  = ref.read(newsRepositoryAutoProvider.notifier);
    final result = await repo.fetchTopHeadlines(country ?? "uss");
    return result.fold(
          (error) {
        state = AsyncError(error,StackTrace.current);
        return [];
      },
          (articles) {
        state = AsyncData(articles);
        return articles;
      },
    );
  }

  Future<List<NewsArticle>> getEveryThing({String? query}) async {
    final repo = ref.read(newsRepositoryAutoProvider.notifier);
    final result = await repo.getEverything(query ?? "apple");
    return result.fold(
        (error){
          state = AsyncError(error, StackTrace.current);
          return [];
        }, (articles) {
          state = AsyncData(articles);
          return articles;
    }
    );
  }

}
/*

final newsViewModelFutureProvider = FutureProvider.autoDispose<List<NewsArticle>>((ref) async {
  String apiKey = dotenv.env['news_key'] ?? "";
  final result = await ref.read(newsRepositoryProvider).fetchTopHeadlines("us", apiKey);
  return result.fold(
        (error) {
      print('Error: $error');
      return []; // Return an empty list on error
    },
        (articles) => articles, // Return the list of articles on success
  );


});



final newsViewModelProvider = StateNotifierProvider<NewsViewModel, AsyncValue<List<NewsArticle>>>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return NewsViewModel(repository);
});



class NewsViewModel extends StateNotifier<AsyncValue<List<NewsArticle>>> {
  final NewsRepository repository;


  NewsViewModel(this.repository) : super(AsyncLoading()){
    getTopHeadlines();
  }


  Future<void> getTopHeadlines({String? country}) async {
    String apiKey = dotenv.env['news_key'] ?? "";
    final result = await repository.fetchTopHeadlines(country ?? "apple", apiKey);
    result.fold(
          (error) => state = AsyncError(error.toString(), StackTrace.current),
          (articles) => state = AsyncData(articles),
    );
  }
}
*/

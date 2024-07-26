import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_client/api_service.dart';
import '../repository/news_repository.dart';
import 'dio_provider.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

final newsApiKeyProvider = Provider<String>((ref) => dotenv.env['news_key'] ?? "");
/*

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final apiClient = ref.watch(apiServiceProvider);
  return NewsRepository(apiClient);
});*/

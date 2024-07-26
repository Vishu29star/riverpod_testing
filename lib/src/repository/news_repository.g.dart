// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsRepositoryAutoHash() =>
    r'ee5e9a75d87bbbdf13ee08beb2a88f4693bd7a84';

/// See also [NewsRepositoryAuto].
@ProviderFor(NewsRepositoryAuto)
final newsRepositoryAutoProvider = AutoDisposeAsyncNotifierProvider<
    NewsRepositoryAuto, Either<String, List<NewsArticle>>>.internal(
  NewsRepositoryAuto.new,
  name: r'newsRepositoryAutoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRepositoryAutoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewsRepositoryAuto
    = AutoDisposeAsyncNotifier<Either<String, List<NewsArticle>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

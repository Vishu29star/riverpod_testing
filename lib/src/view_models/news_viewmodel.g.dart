// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoNewsModelHash() => r'96f818d41e735b075baa2321d77dd7cef03472b6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$AutoNewsModel
    extends BuildlessAutoDisposeAsyncNotifier<List<NewsArticle>> {
  late final String country;

  FutureOr<List<NewsArticle>> build(
    String country,
  );
}

/// See also [AutoNewsModel].
@ProviderFor(AutoNewsModel)
const autoNewsModelProvider = AutoNewsModelFamily();

/// See also [AutoNewsModel].
class AutoNewsModelFamily extends Family<AsyncValue<List<NewsArticle>>> {
  /// See also [AutoNewsModel].
  const AutoNewsModelFamily();

  /// See also [AutoNewsModel].
  AutoNewsModelProvider call(
    String country,
  ) {
    return AutoNewsModelProvider(
      country,
    );
  }

  @override
  AutoNewsModelProvider getProviderOverride(
    covariant AutoNewsModelProvider provider,
  ) {
    return call(
      provider.country,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'autoNewsModelProvider';
}

/// See also [AutoNewsModel].
class AutoNewsModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AutoNewsModel, List<NewsArticle>> {
  /// See also [AutoNewsModel].
  AutoNewsModelProvider(
    String country,
  ) : this._internal(
          () => AutoNewsModel()..country = country,
          from: autoNewsModelProvider,
          name: r'autoNewsModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoNewsModelHash,
          dependencies: AutoNewsModelFamily._dependencies,
          allTransitiveDependencies:
              AutoNewsModelFamily._allTransitiveDependencies,
          country: country,
        );

  AutoNewsModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.country,
  }) : super.internal();

  final String country;

  @override
  FutureOr<List<NewsArticle>> runNotifierBuild(
    covariant AutoNewsModel notifier,
  ) {
    return notifier.build(
      country,
    );
  }

  @override
  Override overrideWith(AutoNewsModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: AutoNewsModelProvider._internal(
        () => create()..country = country,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        country: country,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AutoNewsModel, List<NewsArticle>>
      createElement() {
    return _AutoNewsModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoNewsModelProvider && other.country == country;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, country.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AutoNewsModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<NewsArticle>> {
  /// The parameter `country` of this provider.
  String get country;
}

class _AutoNewsModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AutoNewsModel,
        List<NewsArticle>> with AutoNewsModelRef {
  _AutoNewsModelProviderElement(super.provider);

  @override
  String get country => (origin as AutoNewsModelProvider).country;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

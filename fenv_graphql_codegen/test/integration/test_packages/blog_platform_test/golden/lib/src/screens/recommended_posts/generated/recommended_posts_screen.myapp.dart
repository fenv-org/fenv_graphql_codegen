// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, unused_import, require_trailing_commas
// ignore_for_file: use_test_friendly_graphql_operation
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: invalid_null_aware_operator

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:blog_platform_test/src/screens/recommended_posts/generated/recommended_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/features/post_card/generated/post_card.graphql.dart';

extension Myapp$Query$RecommendedPostsScreen$Extension on GraphQLClient {
  Myapp$Query$RecommendedPostsScreen$Operation
  get myapp$Query$RecommendedPostsScreen =>
      Myapp$Query$RecommendedPostsScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$RecommendedPostsScreen =
    Future<QueryResult<Query$RecommendedPostsScreen>> Function(
      GraphQLClient client, [
      Options$Query$RecommendedPostsScreen? options,
    ]);

class Myapp$Query$RecommendedPostsScreen$Operation
    implements
        PaginatedQueryOperation<
          Query$RecommendedPostsScreen,
          Options$Query$RecommendedPostsScreen?,
          Fragment$PostCard,
          Query$RecommendedPostsScreen$Extra
        > {
  const Myapp$Query$RecommendedPostsScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$RecommendedPostsScreen>> call([
    Options$Query$RecommendedPostsScreen? options,
  ]) {
    Myapp$Query$RecommendedPostsScreen impl =
        _myapp$Query$RecommendedPostsScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$RecommendedPostsScreen != null) {
        impl = debugOverride$Myapp$Query$RecommendedPostsScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$RecommendedPostsScreen>> Function({
    Options$Query$RecommendedPostsScreen? options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withNullableOptions(call);

  @override
  Myapp$Query$RecommendedPostsScreen$PaginationMetaExtractor get extractor =>
      const Myapp$Query$RecommendedPostsScreen$PaginationMetaExtractor();
}

@visibleForTesting
Myapp$Query$RecommendedPostsScreen?
debugOverride$Myapp$Query$RecommendedPostsScreen;

Future<QueryResult<Query$RecommendedPostsScreen>>
_myapp$Query$RecommendedPostsScreenImpl(
  GraphQLClient client, [
  Options$Query$RecommendedPostsScreen? options,
]) {
  return client.query$RecommendedPostsScreen(
    options ?? Options$Query$RecommendedPostsScreen(),
  );
}

typedef Query$RecommendedPostsScreen$Extra$recommendedPosts = ({
  String id,
  Enum$RecommendationType type,
  String title,
  String? description,
});

typedef Query$RecommendedPostsScreen$Extra = ({
  Query$RecommendedPostsScreen$Extra$recommendedPosts recommendedPosts,
});

final class Myapp$Query$RecommendedPostsScreen$PaginationMetaExtractor
    implements
        PaginationMetaExtractor<
          Query$RecommendedPostsScreen,
          Fragment$PostCard,
          Query$RecommendedPostsScreen$Extra
        > {
  const Myapp$Query$RecommendedPostsScreen$PaginationMetaExtractor();

  @override
  bool hasNextPage(Query$RecommendedPostsScreen query) =>
      query.recommendedPosts.posts.pageInfo.hasNextPage;

  @override
  String? endCursor(Query$RecommendedPostsScreen query) =>
      query.recommendedPosts.posts.pageInfo.endCursor;

  @override
  Iterable<Fragment$PostCard> nodes(Query$RecommendedPostsScreen query) =>
      query.recommendedPosts.posts.edges?.map((edge) => edge?.node).nonNulls ??
      const <Fragment$PostCard>[];

  @override
  Query$RecommendedPostsScreen$Extra extra(
    Query$RecommendedPostsScreen query,
  ) => (
    recommendedPosts: (
      id: query.recommendedPosts.id,
      type: query.recommendedPosts.type,
      title: query.recommendedPosts.title,
      description: query.recommendedPosts.description,
    ),
  );
}

typedef Myapp$Query$RecommendedPostsScreen$HookResult =
    StrictQueryHookResult<
      Query$RecommendedPostsScreen,
      Variables$Query$RecommendedPostsScreen
    >;

typedef Myapp$FetchMore$Query$RecommendedPostsScreen =
    StrictFetchMore<
      Query$RecommendedPostsScreen,
      Variables$Query$RecommendedPostsScreen
    >;

typedef Myapp$FetchMoreOptions$Query$RecommendedPostsScreen =
    StrictFetchMoreOptions<
      Query$RecommendedPostsScreen,
      Variables$Query$RecommendedPostsScreen
    >;

Myapp$Query$RecommendedPostsScreen$HookResult
useMyapp$Query$RecommendedPostsScreen([
  Options$Query$RecommendedPostsScreen? options,
]) {
  UseMyapp$Query$RecommendedPostsScreen impl =
      _useMyapp$Query$RecommendedPostsScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$RecommendedPostsScreen != null) {
      impl = debugOverride$UseMyapp$Query$RecommendedPostsScreen!;
    }
    return true;
  }());
  return impl(options ?? Options$Query$RecommendedPostsScreen());
}

@visibleForTesting
typedef UseMyapp$Query$RecommendedPostsScreen =
    Myapp$Query$RecommendedPostsScreen$HookResult Function([
      Options$Query$RecommendedPostsScreen? options,
    ]);

@visibleForTesting
UseMyapp$Query$RecommendedPostsScreen?
debugOverride$UseMyapp$Query$RecommendedPostsScreen;

Myapp$Query$RecommendedPostsScreen$HookResult
_useMyapp$Query$RecommendedPostsScreenImpl([
  Options$Query$RecommendedPostsScreen? options,
]) {
  final client = useGraphQLClient();
  final (query, asyncSnapshot) =
      QueryHooksImplementationHelpers.useQueryOnClient<
        Query$RecommendedPostsScreen
      >(client, options ?? Options$Query$RecommendedPostsScreen());

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$RecommendedPostsScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$RecommendedPostsScreen.fromJson,
          toJson: (data) => data.toJson(),
        ),
      ),
    ),
    [query],
  );

  return StrictQueryHookResult(
    result: asyncSnapshot.data!,
    refetch: refetch,
    fetchMore: fetchMore,
  );
}

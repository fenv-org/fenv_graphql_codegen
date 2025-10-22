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
import 'package:blog_platform_test/src/screens/trending_posts/generated/trending_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/features/post_card/generated/post_card.graphql.dart';

extension Myapp$Query$TrendingPostsScreen$Extension on GraphQLClient {
  Myapp$Query$TrendingPostsScreen$Operation
  get myapp$Query$TrendingPostsScreen =>
      Myapp$Query$TrendingPostsScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$TrendingPostsScreen =
    Future<QueryResult<Query$TrendingPostsScreen>> Function(
      GraphQLClient client,
      Options$Query$TrendingPostsScreen options,
    );

class Myapp$Query$TrendingPostsScreen$Operation
    implements
        PaginatedQueryOperation<
          Query$TrendingPostsScreen,
          Options$Query$TrendingPostsScreen,
          Fragment$PostCard,
          void
        > {
  const Myapp$Query$TrendingPostsScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$TrendingPostsScreen>> call(
    Options$Query$TrendingPostsScreen options,
  ) {
    Myapp$Query$TrendingPostsScreen impl = _myapp$Query$TrendingPostsScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$TrendingPostsScreen != null) {
        impl = debugOverride$Myapp$Query$TrendingPostsScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$TrendingPostsScreen>> Function({
    required Options$Query$TrendingPostsScreen options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withRequiredOptions(call);

  @override
  Myapp$Query$TrendingPostsScreen$PaginationMetaExtractor get extractor =>
      const Myapp$Query$TrendingPostsScreen$PaginationMetaExtractor();
}

@visibleForTesting
Myapp$Query$TrendingPostsScreen? debugOverride$Myapp$Query$TrendingPostsScreen;

Future<QueryResult<Query$TrendingPostsScreen>>
_myapp$Query$TrendingPostsScreenImpl(
  GraphQLClient client,
  Options$Query$TrendingPostsScreen options,
) {
  return client.query$TrendingPostsScreen(options);
}

final class Myapp$Query$TrendingPostsScreen$PaginationMetaExtractor
    implements
        PaginationMetaExtractor<
          Query$TrendingPostsScreen,
          Fragment$PostCard,
          ()
        > {
  const Myapp$Query$TrendingPostsScreen$PaginationMetaExtractor();

  @override
  bool hasNextPage(Query$TrendingPostsScreen query) =>
      query.trendingPosts.pageInfo.hasNextPage;

  @override
  String? endCursor(Query$TrendingPostsScreen query) =>
      query.trendingPosts.pageInfo.endCursor;

  @override
  Iterable<Fragment$PostCard> nodes(Query$TrendingPostsScreen query) =>
      query.trendingPosts.edges?.map((edge) => edge?.node).nonNulls ??
      const <Fragment$PostCard>[];

  @override
  () extra(Query$TrendingPostsScreen query) => const ();
}

typedef Myapp$Query$TrendingPostsScreen$HookResult =
    StrictQueryHookResult<
      Query$TrendingPostsScreen,
      Variables$Query$TrendingPostsScreen
    >;

typedef Myapp$FetchMore$Query$TrendingPostsScreen =
    StrictFetchMore<
      Query$TrendingPostsScreen,
      Variables$Query$TrendingPostsScreen
    >;

typedef Myapp$FetchMoreOptions$Query$TrendingPostsScreen =
    StrictFetchMoreOptions<
      Query$TrendingPostsScreen,
      Variables$Query$TrendingPostsScreen
    >;

Myapp$Query$TrendingPostsScreen$HookResult useMyapp$Query$TrendingPostsScreen(
  Options$Query$TrendingPostsScreen options,
) {
  UseMyapp$Query$TrendingPostsScreen impl =
      _useMyapp$Query$TrendingPostsScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$TrendingPostsScreen != null) {
      impl = debugOverride$UseMyapp$Query$TrendingPostsScreen!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Query$TrendingPostsScreen =
    Myapp$Query$TrendingPostsScreen$HookResult Function(
      Options$Query$TrendingPostsScreen options,
    );

@visibleForTesting
UseMyapp$Query$TrendingPostsScreen?
debugOverride$UseMyapp$Query$TrendingPostsScreen;

Myapp$Query$TrendingPostsScreen$HookResult
_useMyapp$Query$TrendingPostsScreenImpl(
  Options$Query$TrendingPostsScreen options,
) {
  final client = useGraphQLClient();
  final (query, asyncSnapshot) =
      QueryHooksImplementationHelpers.useQueryOnClient<
        Query$TrendingPostsScreen
      >(client, options);

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$TrendingPostsScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$TrendingPostsScreen.fromJson,
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

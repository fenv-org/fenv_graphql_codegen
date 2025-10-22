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
import 'package:blog_platform_test/src/screens/author_posts/generated/author_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/features/author/generated/author_fragment.graphql.dart';
import 'package:blog_platform_test/src/features/post_card/generated/post_card.graphql.dart';

extension Myapp$Query$AuthorPostsScreen$Extension on GraphQLClient {
  Myapp$Query$AuthorPostsScreen$Operation get myapp$Query$AuthorPostsScreen =>
      Myapp$Query$AuthorPostsScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$AuthorPostsScreen =
    Future<QueryResult<Query$AuthorPostsScreen>> Function(
      GraphQLClient client,
      Options$Query$AuthorPostsScreen options,
    );

class Myapp$Query$AuthorPostsScreen$Operation
    implements
        PaginatedQueryOperation<
          Query$AuthorPostsScreen,
          Options$Query$AuthorPostsScreen,
          Fragment$PostCard,
          Query$AuthorPostsScreen$Extra
        > {
  const Myapp$Query$AuthorPostsScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$AuthorPostsScreen>> call(
    Options$Query$AuthorPostsScreen options,
  ) {
    Myapp$Query$AuthorPostsScreen impl = _myapp$Query$AuthorPostsScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$AuthorPostsScreen != null) {
        impl = debugOverride$Myapp$Query$AuthorPostsScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$AuthorPostsScreen>> Function({
    required Options$Query$AuthorPostsScreen options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withRequiredOptions(call);

  @override
  Myapp$Query$AuthorPostsScreen$PaginationMetaExtractor get extractor =>
      const Myapp$Query$AuthorPostsScreen$PaginationMetaExtractor();
}

@visibleForTesting
Myapp$Query$AuthorPostsScreen? debugOverride$Myapp$Query$AuthorPostsScreen;

Future<QueryResult<Query$AuthorPostsScreen>> _myapp$Query$AuthorPostsScreenImpl(
  GraphQLClient client,
  Options$Query$AuthorPostsScreen options,
) {
  return client.query$AuthorPostsScreen(options);
}

typedef Query$AuthorPostsScreen$Extra = ({Fragment$AuthorInfo? author});

final class Myapp$Query$AuthorPostsScreen$PaginationMetaExtractor
    implements
        PaginationMetaExtractor<
          Query$AuthorPostsScreen,
          Fragment$PostCard,
          Query$AuthorPostsScreen$Extra
        > {
  const Myapp$Query$AuthorPostsScreen$PaginationMetaExtractor();

  @override
  bool hasNextPage(Query$AuthorPostsScreen query) =>
      query.authorPosts.pageInfo.hasNextPage;

  @override
  String? endCursor(Query$AuthorPostsScreen query) =>
      query.authorPosts.pageInfo.endCursor;

  @override
  Iterable<Fragment$PostCard> nodes(Query$AuthorPostsScreen query) =>
      query.authorPosts.edges?.map((edge) => edge?.node).nonNulls ??
      const <Fragment$PostCard>[];

  @override
  Query$AuthorPostsScreen$Extra extra(Query$AuthorPostsScreen query) =>
      (author: query.author);
}

typedef Myapp$Query$AuthorPostsScreen$HookResult =
    StrictQueryHookResult<
      Query$AuthorPostsScreen,
      Variables$Query$AuthorPostsScreen
    >;

typedef Myapp$FetchMore$Query$AuthorPostsScreen =
    StrictFetchMore<Query$AuthorPostsScreen, Variables$Query$AuthorPostsScreen>;

typedef Myapp$FetchMoreOptions$Query$AuthorPostsScreen =
    StrictFetchMoreOptions<
      Query$AuthorPostsScreen,
      Variables$Query$AuthorPostsScreen
    >;

Myapp$Query$AuthorPostsScreen$HookResult useMyapp$Query$AuthorPostsScreen(
  Options$Query$AuthorPostsScreen options,
) {
  UseMyapp$Query$AuthorPostsScreen impl = _useMyapp$Query$AuthorPostsScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$AuthorPostsScreen != null) {
      impl = debugOverride$UseMyapp$Query$AuthorPostsScreen!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Query$AuthorPostsScreen =
    Myapp$Query$AuthorPostsScreen$HookResult Function(
      Options$Query$AuthorPostsScreen options,
    );

@visibleForTesting
UseMyapp$Query$AuthorPostsScreen?
debugOverride$UseMyapp$Query$AuthorPostsScreen;

Myapp$Query$AuthorPostsScreen$HookResult _useMyapp$Query$AuthorPostsScreenImpl(
  Options$Query$AuthorPostsScreen options,
) {
  final client = useGraphQLClient();
  final (
    query,
    asyncSnapshot,
  ) = QueryHooksImplementationHelpers.useQueryOnClient<Query$AuthorPostsScreen>(
    client,
    options,
  );

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$AuthorPostsScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$AuthorPostsScreen.fromJson,
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

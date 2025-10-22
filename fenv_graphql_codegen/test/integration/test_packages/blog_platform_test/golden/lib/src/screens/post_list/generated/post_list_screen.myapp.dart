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
import 'package:blog_platform_test/src/screens/post_list/generated/post_list_screen.graphql.dart';
import 'package:blog_platform_test/src/features/post_card/generated/post_card.graphql.dart';

extension Myapp$Query$PostListScreen$Extension on GraphQLClient {
  Myapp$Query$PostListScreen$Operation get myapp$Query$PostListScreen =>
      Myapp$Query$PostListScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$PostListScreen =
    Future<QueryResult<Query$PostListScreen>> Function(
      GraphQLClient client, [
      Options$Query$PostListScreen? options,
    ]);

class Myapp$Query$PostListScreen$Operation
    implements
        PaginatedQueryOperation<
          Query$PostListScreen,
          Options$Query$PostListScreen?,
          Fragment$PostCard,
          void
        > {
  const Myapp$Query$PostListScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$PostListScreen>> call([
    Options$Query$PostListScreen? options,
  ]) {
    Myapp$Query$PostListScreen impl = _myapp$Query$PostListScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$PostListScreen != null) {
        impl = debugOverride$Myapp$Query$PostListScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$PostListScreen>> Function({
    Options$Query$PostListScreen? options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withNullableOptions(call);

  @override
  Myapp$Query$PostListScreen$PaginationMetaExtractor get extractor =>
      const Myapp$Query$PostListScreen$PaginationMetaExtractor();
}

@visibleForTesting
Myapp$Query$PostListScreen? debugOverride$Myapp$Query$PostListScreen;

Future<QueryResult<Query$PostListScreen>> _myapp$Query$PostListScreenImpl(
  GraphQLClient client, [
  Options$Query$PostListScreen? options,
]) {
  return client.query$PostListScreen(options ?? Options$Query$PostListScreen());
}

final class Myapp$Query$PostListScreen$PaginationMetaExtractor
    implements
        PaginationMetaExtractor<Query$PostListScreen, Fragment$PostCard, ()> {
  const Myapp$Query$PostListScreen$PaginationMetaExtractor();

  @override
  bool hasNextPage(Query$PostListScreen query) =>
      query.posts.pageInfo.hasNextPage;

  @override
  String? endCursor(Query$PostListScreen query) =>
      query.posts.pageInfo.endCursor;

  @override
  Iterable<Fragment$PostCard> nodes(Query$PostListScreen query) =>
      query.posts.edges?.map((edge) => edge?.node).nonNulls ??
      const <Fragment$PostCard>[];

  @override
  () extra(Query$PostListScreen query) => const ();
}

typedef Myapp$Query$PostListScreen$HookResult =
    StrictQueryHookResult<Query$PostListScreen, Variables$Query$PostListScreen>;

typedef Myapp$FetchMore$Query$PostListScreen =
    StrictFetchMore<Query$PostListScreen, Variables$Query$PostListScreen>;

typedef Myapp$FetchMoreOptions$Query$PostListScreen =
    StrictFetchMoreOptions<
      Query$PostListScreen,
      Variables$Query$PostListScreen
    >;

Myapp$Query$PostListScreen$HookResult useMyapp$Query$PostListScreen([
  Options$Query$PostListScreen? options,
]) {
  UseMyapp$Query$PostListScreen impl = _useMyapp$Query$PostListScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$PostListScreen != null) {
      impl = debugOverride$UseMyapp$Query$PostListScreen!;
    }
    return true;
  }());
  return impl(options ?? Options$Query$PostListScreen());
}

@visibleForTesting
typedef UseMyapp$Query$PostListScreen =
    Myapp$Query$PostListScreen$HookResult Function([
      Options$Query$PostListScreen? options,
    ]);

@visibleForTesting
UseMyapp$Query$PostListScreen? debugOverride$UseMyapp$Query$PostListScreen;

Myapp$Query$PostListScreen$HookResult _useMyapp$Query$PostListScreenImpl([
  Options$Query$PostListScreen? options,
]) {
  final client = useGraphQLClient();
  final (
    query,
    asyncSnapshot,
  ) = QueryHooksImplementationHelpers.useQueryOnClient<Query$PostListScreen>(
    client,
    options ?? Options$Query$PostListScreen(),
  );

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$PostListScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$PostListScreen.fromJson,
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

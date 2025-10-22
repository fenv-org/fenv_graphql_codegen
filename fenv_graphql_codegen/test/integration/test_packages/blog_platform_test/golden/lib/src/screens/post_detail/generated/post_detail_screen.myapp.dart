// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, unused_import, require_trailing_commas
// ignore_for_file: use_test_friendly_graphql_operation
// ignore_for_file: always_put_required_named_parameters_first

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:blog_platform_test/src/screens/post_detail/generated/post_detail_screen.graphql.dart';
import 'package:blog_platform_test/src/features/comment/generated/comment_fragment.graphql.dart';

extension Myapp$Query$PostDetailScreen$Extension on GraphQLClient {
  Myapp$Query$PostDetailScreen$Operation get myapp$Query$PostDetailScreen =>
      Myapp$Query$PostDetailScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$PostDetailScreen =
    Future<QueryResult<Query$PostDetailScreen>> Function(
      GraphQLClient client,
      Options$Query$PostDetailScreen options,
    );

class Myapp$Query$PostDetailScreen$Operation
    implements
        PaginatedQueryOperation<
          Query$PostDetailScreen,
          Options$Query$PostDetailScreen,
          Fragment$CommentItem,
          Query$PostDetailScreen$Extra
        > {
  const Myapp$Query$PostDetailScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$PostDetailScreen>> call(
    Options$Query$PostDetailScreen options,
  ) {
    Myapp$Query$PostDetailScreen impl = _myapp$Query$PostDetailScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$PostDetailScreen != null) {
        impl = debugOverride$Myapp$Query$PostDetailScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$PostDetailScreen>> Function({
    required Options$Query$PostDetailScreen options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withRequiredOptions(call);

  @override
  Myapp$Query$PostDetailScreen$PaginationMetaExtractor get extractor =>
      const Myapp$Query$PostDetailScreen$PaginationMetaExtractor();
}

@visibleForTesting
Myapp$Query$PostDetailScreen? debugOverride$Myapp$Query$PostDetailScreen;

Future<QueryResult<Query$PostDetailScreen>> _myapp$Query$PostDetailScreenImpl(
  GraphQLClient client,
  Options$Query$PostDetailScreen options,
) {
  return client.query$PostDetailScreen(options);
}

typedef Query$PostDetailScreen$Extra = ({Query$PostDetailScreen$post? post});

final class Myapp$Query$PostDetailScreen$PaginationMetaExtractor
    implements
        PaginationMetaExtractor<
          Query$PostDetailScreen,
          Fragment$CommentItem,
          Query$PostDetailScreen$Extra
        > {
  const Myapp$Query$PostDetailScreen$PaginationMetaExtractor();

  @override
  bool hasNextPage(Query$PostDetailScreen query) =>
      query.comments.pageInfo.hasNextPage;

  @override
  String? endCursor(Query$PostDetailScreen query) =>
      query.comments.pageInfo.endCursor;

  @override
  Iterable<Fragment$CommentItem> nodes(Query$PostDetailScreen query) =>
      query.comments.edges?.map((edge) => edge?.node).nonNulls ??
      const <Fragment$CommentItem>[];

  @override
  Query$PostDetailScreen$Extra extra(Query$PostDetailScreen query) =>
      (post: query.post);
}

typedef Myapp$Query$PostDetailScreen$HookResult =
    StrictQueryHookResult<
      Query$PostDetailScreen,
      Variables$Query$PostDetailScreen
    >;

typedef Myapp$FetchMore$Query$PostDetailScreen =
    StrictFetchMore<Query$PostDetailScreen, Variables$Query$PostDetailScreen>;

typedef Myapp$FetchMoreOptions$Query$PostDetailScreen =
    StrictFetchMoreOptions<
      Query$PostDetailScreen,
      Variables$Query$PostDetailScreen
    >;

Myapp$Query$PostDetailScreen$HookResult useMyapp$Query$PostDetailScreen(
  Options$Query$PostDetailScreen options,
) {
  UseMyapp$Query$PostDetailScreen impl = _useMyapp$Query$PostDetailScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$PostDetailScreen != null) {
      impl = debugOverride$UseMyapp$Query$PostDetailScreen!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Query$PostDetailScreen =
    Myapp$Query$PostDetailScreen$HookResult Function(
      Options$Query$PostDetailScreen options,
    );

@visibleForTesting
UseMyapp$Query$PostDetailScreen? debugOverride$UseMyapp$Query$PostDetailScreen;

Myapp$Query$PostDetailScreen$HookResult _useMyapp$Query$PostDetailScreenImpl(
  Options$Query$PostDetailScreen options,
) {
  final client = useGraphQLClient();
  final (
    query,
    asyncSnapshot,
  ) = QueryHooksImplementationHelpers.useQueryOnClient<Query$PostDetailScreen>(
    client,
    options,
  );

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$PostDetailScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$PostDetailScreen.fromJson,
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

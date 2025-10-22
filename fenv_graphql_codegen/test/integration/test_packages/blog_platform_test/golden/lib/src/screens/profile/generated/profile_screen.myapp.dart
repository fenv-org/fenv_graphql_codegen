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
import 'package:blog_platform_test/src/screens/profile/generated/profile_screen.graphql.dart';

extension Myapp$Query$ProfileScreen$Extension on GraphQLClient {
  Myapp$Query$ProfileScreen$Operation get myapp$Query$ProfileScreen =>
      Myapp$Query$ProfileScreen$Operation(this);
}

@visibleForTesting
typedef Myapp$Query$ProfileScreen =
    Future<QueryResult<Query$ProfileScreen>> Function(
      GraphQLClient client, [
      Options$Query$ProfileScreen? options,
    ]);

class Myapp$Query$ProfileScreen$Operation
    implements
        SimpleQueryOperation<
          Query$ProfileScreen,
          Options$Query$ProfileScreen?
        > {
  const Myapp$Query$ProfileScreen$Operation(this._client);

  final GraphQLClient _client;

  Future<QueryResult<Query$ProfileScreen>> call([
    Options$Query$ProfileScreen? options,
  ]) {
    Myapp$Query$ProfileScreen impl = _myapp$Query$ProfileScreenImpl;
    assert(() {
      if (debugOverride$Myapp$Query$ProfileScreen != null) {
        impl = debugOverride$Myapp$Query$ProfileScreen!;
      }
      return true;
    }());
    return impl(_client, options);
  }

  @override
  Future<QueryResult<Query$ProfileScreen>> Function({
    Options$Query$ProfileScreen? options,
    required bool retryOnNetworkError,
  })
  get fetcher => FetcherFactory.withNullableOptions(call);
}

@visibleForTesting
Myapp$Query$ProfileScreen? debugOverride$Myapp$Query$ProfileScreen;

Future<QueryResult<Query$ProfileScreen>> _myapp$Query$ProfileScreenImpl(
  GraphQLClient client, [
  Options$Query$ProfileScreen? options,
]) {
  return client.query$ProfileScreen(options ?? Options$Query$ProfileScreen());
}

typedef Myapp$Query$ProfileScreen$HookResult =
    StrictQueryHookResult<Query$ProfileScreen, Variables$Query$ProfileScreen>;

typedef Myapp$FetchMore$Query$ProfileScreen =
    StrictFetchMore<Query$ProfileScreen, Variables$Query$ProfileScreen>;

typedef Myapp$FetchMoreOptions$Query$ProfileScreen =
    StrictFetchMoreOptions<Query$ProfileScreen, Variables$Query$ProfileScreen>;

Myapp$Query$ProfileScreen$HookResult useMyapp$Query$ProfileScreen([
  Options$Query$ProfileScreen? options,
]) {
  UseMyapp$Query$ProfileScreen impl = _useMyapp$Query$ProfileScreenImpl;
  assert(() {
    if (debugOverride$UseMyapp$Query$ProfileScreen != null) {
      impl = debugOverride$UseMyapp$Query$ProfileScreen!;
    }
    return true;
  }());
  return impl(options ?? Options$Query$ProfileScreen());
}

@visibleForTesting
typedef UseMyapp$Query$ProfileScreen =
    Myapp$Query$ProfileScreen$HookResult Function([
      Options$Query$ProfileScreen? options,
    ]);

@visibleForTesting
UseMyapp$Query$ProfileScreen? debugOverride$UseMyapp$Query$ProfileScreen;

Myapp$Query$ProfileScreen$HookResult _useMyapp$Query$ProfileScreenImpl([
  Options$Query$ProfileScreen? options,
]) {
  final client = useGraphQLClient();
  final (
    query,
    asyncSnapshot,
  ) = QueryHooksImplementationHelpers.useQueryOnClient<Query$ProfileScreen>(
    client,
    options ?? Options$Query$ProfileScreen(),
  );

  final refetch = useCallback(
    () async => query.isRefetchSafe ? query.refetch() : null,
    [query],
  );

  final fetchMore = useCallback<Myapp$FetchMore$Query$ProfileScreen>(
    (options) => query.fetchMore(
      FetchMoreOptions(
        document: options.document,
        variables: options.variables?.toJson() ?? const {},
        updateQuery: options.updateQuery.toUpdateQuery(
          fromJson: Query$ProfileScreen.fromJson,
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

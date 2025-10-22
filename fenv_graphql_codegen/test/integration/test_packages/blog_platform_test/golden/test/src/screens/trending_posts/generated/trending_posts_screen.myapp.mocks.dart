// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, unused_import, require_trailing_commas
// ignore_for_file: unnecessary_null_comparison, implicit_call_tearoffs
// ignore_for_file: use_test_friendly_graphql_operation

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:fenv_graphql_test/fenv_graphql_test.dart';
import 'package:blog_platform_test/src/screens/trending_posts/generated/trending_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/trending_posts/generated/trending_posts_screen.myapp.dart';

class MockMyapp$Query$TrendingPostsScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$TrendingPostsScreen,
          Variables$Query$TrendingPostsScreen
        > {
  @override
  Variables$Query$TrendingPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$TrendingPostsScreen.fromJson;

  @override
  Query$TrendingPostsScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$TrendingPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$TrendingPostsScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$TrendingPostsScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$TrendingPostsScreen = null;
  }

  Future<QueryResult<Query$TrendingPostsScreen>> call(
    GraphQLClient client,
    Options$Query$TrendingPostsScreen options,
  ) {
    return fetch(options);
  }
}

class MockUseMyapp$Query$TrendingPostsScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$TrendingPostsScreen,
          Variables$Query$TrendingPostsScreen
        > {
  @override
  Variables$Query$TrendingPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$TrendingPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$TrendingPostsScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$TrendingPostsScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$TrendingPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$TrendingPostsScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$TrendingPostsScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$TrendingPostsScreen = null;
  }

  Myapp$Query$TrendingPostsScreen$HookResult call(
    Options$Query$TrendingPostsScreen options,
  ) {
    dirty = useState(0);

    useEffect(() {
      latest = QueryResult(options: options, source: QueryResultSource.loading);
      return null;
    }, const []);

    useEffect(() {
      latestOptions = options;
      fetch();
      return null;
    }, [options, dataBuilder]);

    return StrictQueryHookResult.fromResultSupplier(
      resultSupplier: () => latest,
      refetch: refetch,
      fetchMore: fetchMore,
    );
  }
}

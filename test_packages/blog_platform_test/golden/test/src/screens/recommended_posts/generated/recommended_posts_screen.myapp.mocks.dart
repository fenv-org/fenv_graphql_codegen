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
import 'package:blog_platform_test/src/screens/recommended_posts/generated/recommended_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/recommended_posts/generated/recommended_posts_screen.myapp.dart';

class MockMyapp$Query$RecommendedPostsScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$RecommendedPostsScreen,
          Variables$Query$RecommendedPostsScreen
        > {
  @override
  Variables$Query$RecommendedPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$RecommendedPostsScreen.fromJson;

  @override
  Query$RecommendedPostsScreen? Function(Map<String, dynamic>)
  get jsonToParsed => Query$RecommendedPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$RecommendedPostsScreen)
  get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$RecommendedPostsScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$RecommendedPostsScreen = null;
  }

  Future<QueryResult<Query$RecommendedPostsScreen>> call(
    GraphQLClient client, [
    Options$Query$RecommendedPostsScreen? options,
  ]) {
    return fetch(options ?? Options$Query$RecommendedPostsScreen());
  }
}

class MockUseMyapp$Query$RecommendedPostsScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$RecommendedPostsScreen,
          Variables$Query$RecommendedPostsScreen
        > {
  @override
  Variables$Query$RecommendedPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$RecommendedPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$RecommendedPostsScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$RecommendedPostsScreen? Function(Map<String, dynamic>)
  get jsonToParsed => Query$RecommendedPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$RecommendedPostsScreen)
  get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$RecommendedPostsScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$RecommendedPostsScreen = null;
  }

  Myapp$Query$RecommendedPostsScreen$HookResult call([
    Options$Query$RecommendedPostsScreen? options,
  ]) {
    dirty = useState(0);

    useEffect(() {
      latest = QueryResult(
        options: options ?? Options$Query$RecommendedPostsScreen(),
        source: QueryResultSource.loading,
      );
      return null;
    }, const []);

    useEffect(() {
      latestOptions = options ?? Options$Query$RecommendedPostsScreen();
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

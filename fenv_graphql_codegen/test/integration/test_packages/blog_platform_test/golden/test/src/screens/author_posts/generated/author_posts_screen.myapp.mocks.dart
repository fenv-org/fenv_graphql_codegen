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
import 'package:blog_platform_test/src/screens/author_posts/generated/author_posts_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/author_posts/generated/author_posts_screen.myapp.dart';

class MockMyapp$Query$AuthorPostsScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$AuthorPostsScreen,
          Variables$Query$AuthorPostsScreen
        > {
  @override
  Variables$Query$AuthorPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$AuthorPostsScreen.fromJson;

  @override
  Query$AuthorPostsScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$AuthorPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$AuthorPostsScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$AuthorPostsScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$AuthorPostsScreen = null;
  }

  Future<QueryResult<Query$AuthorPostsScreen>> call(
    GraphQLClient client,
    Options$Query$AuthorPostsScreen options,
  ) {
    return fetch(options);
  }
}

class MockUseMyapp$Query$AuthorPostsScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$AuthorPostsScreen,
          Variables$Query$AuthorPostsScreen
        > {
  @override
  Variables$Query$AuthorPostsScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$AuthorPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$AuthorPostsScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$AuthorPostsScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$AuthorPostsScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$AuthorPostsScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$AuthorPostsScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$AuthorPostsScreen = null;
  }

  Myapp$Query$AuthorPostsScreen$HookResult call(
    Options$Query$AuthorPostsScreen options,
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

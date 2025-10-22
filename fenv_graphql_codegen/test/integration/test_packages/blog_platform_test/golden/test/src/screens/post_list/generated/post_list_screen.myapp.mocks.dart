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
import 'package:blog_platform_test/src/screens/post_list/generated/post_list_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/post_list/generated/post_list_screen.myapp.dart';

class MockMyapp$Query$PostListScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$PostListScreen,
          Variables$Query$PostListScreen
        > {
  @override
  Variables$Query$PostListScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$PostListScreen.fromJson;

  @override
  Query$PostListScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$PostListScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$PostListScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$PostListScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$PostListScreen = null;
  }

  Future<QueryResult<Query$PostListScreen>> call(
    GraphQLClient client, [
    Options$Query$PostListScreen? options,
  ]) {
    return fetch(options ?? Options$Query$PostListScreen());
  }
}

class MockUseMyapp$Query$PostListScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$PostListScreen,
          Variables$Query$PostListScreen
        > {
  @override
  Variables$Query$PostListScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$PostListScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$PostListScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$PostListScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$PostListScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$PostListScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$PostListScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$PostListScreen = null;
  }

  Myapp$Query$PostListScreen$HookResult call([
    Options$Query$PostListScreen? options,
  ]) {
    dirty = useState(0);

    useEffect(() {
      latest = QueryResult(
        options: options ?? Options$Query$PostListScreen(),
        source: QueryResultSource.loading,
      );
      return null;
    }, const []);

    useEffect(() {
      latestOptions = options ?? Options$Query$PostListScreen();
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

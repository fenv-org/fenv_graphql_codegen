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
import 'package:blog_platform_test/src/screens/post_detail/generated/post_detail_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/post_detail/generated/post_detail_screen.myapp.dart';

class MockMyapp$Query$PostDetailScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$PostDetailScreen,
          Variables$Query$PostDetailScreen
        > {
  @override
  Variables$Query$PostDetailScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$PostDetailScreen.fromJson;

  @override
  Query$PostDetailScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$PostDetailScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$PostDetailScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$PostDetailScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$PostDetailScreen = null;
  }

  Future<QueryResult<Query$PostDetailScreen>> call(
    GraphQLClient client,
    Options$Query$PostDetailScreen options,
  ) {
    return fetch(options);
  }
}

class MockUseMyapp$Query$PostDetailScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$PostDetailScreen,
          Variables$Query$PostDetailScreen
        > {
  @override
  Variables$Query$PostDetailScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$PostDetailScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$PostDetailScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$PostDetailScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$PostDetailScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$PostDetailScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$PostDetailScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$PostDetailScreen = null;
  }

  Myapp$Query$PostDetailScreen$HookResult call(
    Options$Query$PostDetailScreen options,
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

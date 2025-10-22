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
import 'package:blog_platform_test/src/screens/profile/generated/profile_screen.graphql.dart';
import 'package:blog_platform_test/src/screens/profile/generated/profile_screen.myapp.dart';

class MockMyapp$Query$ProfileScreen
    with
        MockFenvQueryMutateWrapperMixin<
          Query$ProfileScreen,
          Variables$Query$ProfileScreen
        > {
  @override
  Variables$Query$ProfileScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$ProfileScreen.fromJson;

  @override
  Query$ProfileScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$ProfileScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$ProfileScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Query$ProfileScreen = this;
  }

  void uninstall() {
    debugOverride$Myapp$Query$ProfileScreen = null;
  }

  Future<QueryResult<Query$ProfileScreen>> call(
    GraphQLClient client, [
    Options$Query$ProfileScreen? options,
  ]) {
    return fetch(options ?? Options$Query$ProfileScreen());
  }
}

class MockUseMyapp$Query$ProfileScreen
    with
        MockUseFenvQueryWrapperMixin<
          Query$ProfileScreen,
          Variables$Query$ProfileScreen
        > {
  @override
  Variables$Query$ProfileScreen? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Query$ProfileScreen.fromJson;

  @override
  Map<String, dynamic> Function(Variables$Query$ProfileScreen)
  get variablesToJson =>
      (variables) => variables.toJson();

  @override
  Query$ProfileScreen? Function(Map<String, dynamic>) get jsonToParsed =>
      Query$ProfileScreen.fromJson;

  @override
  Map<String, dynamic> Function(Query$ProfileScreen) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$UseMyapp$Query$ProfileScreen = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Query$ProfileScreen = null;
  }

  Myapp$Query$ProfileScreen$HookResult call([
    Options$Query$ProfileScreen? options,
  ]) {
    dirty = useState(0);

    useEffect(() {
      latest = QueryResult(
        options: options ?? Options$Query$ProfileScreen(),
        source: QueryResultSource.loading,
      );
      return null;
    }, const []);

    useEffect(() {
      latestOptions = options ?? Options$Query$ProfileScreen();
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

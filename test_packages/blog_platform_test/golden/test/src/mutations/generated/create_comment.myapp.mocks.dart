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
import 'package:blog_platform_test/src/mutations/generated/create_comment.graphql.dart';
import 'package:blog_platform_test/src/mutations/generated/create_comment.myapp.dart';

class MockMyapp$Mutation$CreateComment
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$CreateComment,
          Variables$Mutation$CreateComment
        > {
  @override
  Variables$Mutation$CreateComment? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$CreateComment.fromJson;

  @override
  Mutation$CreateComment? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$CreateComment.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$CreateComment) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$CreateComment = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$CreateComment = null;
  }

  Future<QueryResult<Mutation$CreateComment>> call(
    GraphQLClient client,
    Options$Mutation$CreateComment options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$CreateComment {
  void install() {
    debugOverride$UseMyapp$Mutation$CreateComment = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$CreateComment = null;
  }

  Myapp$Mutation$CreateComment$HookResult call([
    WidgetOptions$Mutation$CreateComment? options,
  ]);
}

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
import 'package:blog_platform_test/src/mutations/generated/create_post.graphql.dart';
import 'package:blog_platform_test/src/mutations/generated/create_post.myapp.dart';

class MockMyapp$Mutation$CreatePost
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$CreatePost,
          Variables$Mutation$CreatePost
        > {
  @override
  Variables$Mutation$CreatePost? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$CreatePost.fromJson;

  @override
  Mutation$CreatePost? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$CreatePost.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$CreatePost) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$CreatePost = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$CreatePost = null;
  }

  Future<QueryResult<Mutation$CreatePost>> call(
    GraphQLClient client,
    Options$Mutation$CreatePost options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$CreatePost {
  void install() {
    debugOverride$UseMyapp$Mutation$CreatePost = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$CreatePost = null;
  }

  Myapp$Mutation$CreatePost$HookResult call([
    WidgetOptions$Mutation$CreatePost? options,
  ]);
}

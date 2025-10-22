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
import 'package:blog_platform_test/src/mutations/generated/like_post.graphql.dart';
import 'package:blog_platform_test/src/mutations/generated/like_post.myapp.dart';

class MockMyapp$Mutation$LikePost
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$LikePost,
          Variables$Mutation$LikePost
        > {
  @override
  Variables$Mutation$LikePost? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$LikePost.fromJson;

  @override
  Mutation$LikePost? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$LikePost.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$LikePost) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$LikePost = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$LikePost = null;
  }

  Future<QueryResult<Mutation$LikePost>> call(
    GraphQLClient client,
    Options$Mutation$LikePost options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$LikePost {
  void install() {
    debugOverride$UseMyapp$Mutation$LikePost = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$LikePost = null;
  }

  Myapp$Mutation$LikePost$HookResult call([
    WidgetOptions$Mutation$LikePost? options,
  ]);
}

class MockMyapp$Mutation$UnlikePost
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$UnlikePost,
          Variables$Mutation$UnlikePost
        > {
  @override
  Variables$Mutation$UnlikePost? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$UnlikePost.fromJson;

  @override
  Mutation$UnlikePost? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$UnlikePost.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$UnlikePost) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$UnlikePost = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$UnlikePost = null;
  }

  Future<QueryResult<Mutation$UnlikePost>> call(
    GraphQLClient client,
    Options$Mutation$UnlikePost options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$UnlikePost {
  void install() {
    debugOverride$UseMyapp$Mutation$UnlikePost = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$UnlikePost = null;
  }

  Myapp$Mutation$UnlikePost$HookResult call([
    WidgetOptions$Mutation$UnlikePost? options,
  ]);
}

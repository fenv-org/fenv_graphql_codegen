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
import 'package:blog_platform_test/src/mutations/generated/follow_author.graphql.dart';
import 'package:blog_platform_test/src/mutations/generated/follow_author.myapp.dart';

class MockMyapp$Mutation$FollowAuthor
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$FollowAuthor,
          Variables$Mutation$FollowAuthor
        > {
  @override
  Variables$Mutation$FollowAuthor? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$FollowAuthor.fromJson;

  @override
  Mutation$FollowAuthor? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$FollowAuthor.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$FollowAuthor) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$FollowAuthor = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$FollowAuthor = null;
  }

  Future<QueryResult<Mutation$FollowAuthor>> call(
    GraphQLClient client,
    Options$Mutation$FollowAuthor options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$FollowAuthor {
  void install() {
    debugOverride$UseMyapp$Mutation$FollowAuthor = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$FollowAuthor = null;
  }

  Myapp$Mutation$FollowAuthor$HookResult call([
    WidgetOptions$Mutation$FollowAuthor? options,
  ]);
}

class MockMyapp$Mutation$UnfollowAuthor
    with
        MockFenvQueryMutateWrapperMixin<
          Mutation$UnfollowAuthor,
          Variables$Mutation$UnfollowAuthor
        > {
  @override
  Variables$Mutation$UnfollowAuthor? Function(Map<String, dynamic>)
  get jsonToVariables => Variables$Mutation$UnfollowAuthor.fromJson;

  @override
  Mutation$UnfollowAuthor? Function(Map<String, dynamic>) get jsonToParsed =>
      Mutation$UnfollowAuthor.fromJson;

  @override
  Map<String, dynamic> Function(Mutation$UnfollowAuthor) get parsedToJson =>
      (parsed) => parsed.toJson();

  void install() {
    debugOverride$Myapp$Mutation$UnfollowAuthor = this;
  }

  void uninstall() {
    debugOverride$Myapp$Mutation$UnfollowAuthor = null;
  }

  Future<QueryResult<Mutation$UnfollowAuthor>> call(
    GraphQLClient client,
    Options$Mutation$UnfollowAuthor options,
  ) {
    return mutate(options);
  }
}

abstract base class MockUseMyapp$Mutation$UnfollowAuthor {
  void install() {
    debugOverride$UseMyapp$Mutation$UnfollowAuthor = this;
  }

  void uninstall() {
    debugOverride$UseMyapp$Mutation$UnfollowAuthor = null;
  }

  Myapp$Mutation$UnfollowAuthor$HookResult call([
    WidgetOptions$Mutation$UnfollowAuthor? options,
  ]);
}

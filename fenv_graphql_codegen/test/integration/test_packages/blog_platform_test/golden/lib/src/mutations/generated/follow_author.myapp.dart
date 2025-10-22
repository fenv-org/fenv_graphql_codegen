// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, unused_import, require_trailing_commas
// ignore_for_file: use_test_friendly_graphql_operation
// ignore_for_file: always_put_required_named_parameters_first

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:blog_platform_test/src/mutations/generated/follow_author.graphql.dart';

extension Myapp$Mutation$FollowAuthor$Extension on GraphQLClient {
  Future<QueryResult<Mutation$FollowAuthor>> myapp$Mutate$FollowAuthor(
    Options$Mutation$FollowAuthor options,
  ) {
    Myapp$Mutation$FollowAuthor impl = _myapp$Mutation$FollowAuthorImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$FollowAuthor != null) {
        impl = debugOverride$Myapp$Mutation$FollowAuthor!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$FollowAuthor =
    Future<QueryResult<Mutation$FollowAuthor>> Function(
      GraphQLClient client,
      Options$Mutation$FollowAuthor options,
    );

@visibleForTesting
Myapp$Mutation$FollowAuthor? debugOverride$Myapp$Mutation$FollowAuthor;

Future<QueryResult<Mutation$FollowAuthor>> _myapp$Mutation$FollowAuthorImpl(
  GraphQLClient client,
  Options$Mutation$FollowAuthor options,
) {
  return client.mutate$FollowAuthor(options);
}

typedef Myapp$Mutation$FollowAuthor$HookResult =
    Mutation$FollowAuthor$HookResult;

Myapp$Mutation$FollowAuthor$HookResult useMyapp$Mutation$FollowAuthor([
  WidgetOptions$Mutation$FollowAuthor? options,
]) {
  UseMyapp$Mutation$FollowAuthor impl = _useMyapp$Mutation$FollowAuthorImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$FollowAuthor != null) {
      impl = debugOverride$UseMyapp$Mutation$FollowAuthor!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$FollowAuthor =
    Myapp$Mutation$FollowAuthor$HookResult Function([
      WidgetOptions$Mutation$FollowAuthor? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$FollowAuthor? debugOverride$UseMyapp$Mutation$FollowAuthor;

Myapp$Mutation$FollowAuthor$HookResult _useMyapp$Mutation$FollowAuthorImpl([
  WidgetOptions$Mutation$FollowAuthor? options,
]) {
  return useMutation$FollowAuthor(options);
}

extension Myapp$Mutation$UnfollowAuthor$Extension on GraphQLClient {
  Future<QueryResult<Mutation$UnfollowAuthor>> myapp$Mutate$UnfollowAuthor(
    Options$Mutation$UnfollowAuthor options,
  ) {
    Myapp$Mutation$UnfollowAuthor impl = _myapp$Mutation$UnfollowAuthorImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$UnfollowAuthor != null) {
        impl = debugOverride$Myapp$Mutation$UnfollowAuthor!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$UnfollowAuthor =
    Future<QueryResult<Mutation$UnfollowAuthor>> Function(
      GraphQLClient client,
      Options$Mutation$UnfollowAuthor options,
    );

@visibleForTesting
Myapp$Mutation$UnfollowAuthor? debugOverride$Myapp$Mutation$UnfollowAuthor;

Future<QueryResult<Mutation$UnfollowAuthor>> _myapp$Mutation$UnfollowAuthorImpl(
  GraphQLClient client,
  Options$Mutation$UnfollowAuthor options,
) {
  return client.mutate$UnfollowAuthor(options);
}

typedef Myapp$Mutation$UnfollowAuthor$HookResult =
    Mutation$UnfollowAuthor$HookResult;

Myapp$Mutation$UnfollowAuthor$HookResult useMyapp$Mutation$UnfollowAuthor([
  WidgetOptions$Mutation$UnfollowAuthor? options,
]) {
  UseMyapp$Mutation$UnfollowAuthor impl = _useMyapp$Mutation$UnfollowAuthorImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$UnfollowAuthor != null) {
      impl = debugOverride$UseMyapp$Mutation$UnfollowAuthor!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$UnfollowAuthor =
    Myapp$Mutation$UnfollowAuthor$HookResult Function([
      WidgetOptions$Mutation$UnfollowAuthor? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$UnfollowAuthor?
debugOverride$UseMyapp$Mutation$UnfollowAuthor;

Myapp$Mutation$UnfollowAuthor$HookResult _useMyapp$Mutation$UnfollowAuthorImpl([
  WidgetOptions$Mutation$UnfollowAuthor? options,
]) {
  return useMutation$UnfollowAuthor(options);
}

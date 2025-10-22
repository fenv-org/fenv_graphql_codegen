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
import 'package:blog_platform_test/src/mutations/generated/like_post.graphql.dart';

extension Myapp$Mutation$LikePost$Extension on GraphQLClient {
  Future<QueryResult<Mutation$LikePost>> myapp$Mutate$LikePost(
    Options$Mutation$LikePost options,
  ) {
    Myapp$Mutation$LikePost impl = _myapp$Mutation$LikePostImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$LikePost != null) {
        impl = debugOverride$Myapp$Mutation$LikePost!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$LikePost =
    Future<QueryResult<Mutation$LikePost>> Function(
      GraphQLClient client,
      Options$Mutation$LikePost options,
    );

@visibleForTesting
Myapp$Mutation$LikePost? debugOverride$Myapp$Mutation$LikePost;

Future<QueryResult<Mutation$LikePost>> _myapp$Mutation$LikePostImpl(
  GraphQLClient client,
  Options$Mutation$LikePost options,
) {
  return client.mutate$LikePost(options);
}

typedef Myapp$Mutation$LikePost$HookResult = Mutation$LikePost$HookResult;

Myapp$Mutation$LikePost$HookResult useMyapp$Mutation$LikePost([
  WidgetOptions$Mutation$LikePost? options,
]) {
  UseMyapp$Mutation$LikePost impl = _useMyapp$Mutation$LikePostImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$LikePost != null) {
      impl = debugOverride$UseMyapp$Mutation$LikePost!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$LikePost =
    Myapp$Mutation$LikePost$HookResult Function([
      WidgetOptions$Mutation$LikePost? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$LikePost? debugOverride$UseMyapp$Mutation$LikePost;

Myapp$Mutation$LikePost$HookResult _useMyapp$Mutation$LikePostImpl([
  WidgetOptions$Mutation$LikePost? options,
]) {
  return useMutation$LikePost(options);
}

extension Myapp$Mutation$UnlikePost$Extension on GraphQLClient {
  Future<QueryResult<Mutation$UnlikePost>> myapp$Mutate$UnlikePost(
    Options$Mutation$UnlikePost options,
  ) {
    Myapp$Mutation$UnlikePost impl = _myapp$Mutation$UnlikePostImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$UnlikePost != null) {
        impl = debugOverride$Myapp$Mutation$UnlikePost!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$UnlikePost =
    Future<QueryResult<Mutation$UnlikePost>> Function(
      GraphQLClient client,
      Options$Mutation$UnlikePost options,
    );

@visibleForTesting
Myapp$Mutation$UnlikePost? debugOverride$Myapp$Mutation$UnlikePost;

Future<QueryResult<Mutation$UnlikePost>> _myapp$Mutation$UnlikePostImpl(
  GraphQLClient client,
  Options$Mutation$UnlikePost options,
) {
  return client.mutate$UnlikePost(options);
}

typedef Myapp$Mutation$UnlikePost$HookResult = Mutation$UnlikePost$HookResult;

Myapp$Mutation$UnlikePost$HookResult useMyapp$Mutation$UnlikePost([
  WidgetOptions$Mutation$UnlikePost? options,
]) {
  UseMyapp$Mutation$UnlikePost impl = _useMyapp$Mutation$UnlikePostImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$UnlikePost != null) {
      impl = debugOverride$UseMyapp$Mutation$UnlikePost!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$UnlikePost =
    Myapp$Mutation$UnlikePost$HookResult Function([
      WidgetOptions$Mutation$UnlikePost? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$UnlikePost? debugOverride$UseMyapp$Mutation$UnlikePost;

Myapp$Mutation$UnlikePost$HookResult _useMyapp$Mutation$UnlikePostImpl([
  WidgetOptions$Mutation$UnlikePost? options,
]) {
  return useMutation$UnlikePost(options);
}

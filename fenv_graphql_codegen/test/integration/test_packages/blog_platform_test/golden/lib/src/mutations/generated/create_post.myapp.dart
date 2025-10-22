// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: directives_ordering, unused_import, require_trailing_commas
// ignore_for_file: use_test_friendly_graphql_operation
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: invalid_null_aware_operator

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/fenv_graphql_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:blog_platform_test/src/mutations/generated/create_post.graphql.dart';

extension Myapp$Mutation$CreatePost$Extension on GraphQLClient {
  Future<QueryResult<Mutation$CreatePost>> myapp$Mutate$CreatePost(
    Options$Mutation$CreatePost options,
  ) {
    Myapp$Mutation$CreatePost impl = _myapp$Mutation$CreatePostImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$CreatePost != null) {
        impl = debugOverride$Myapp$Mutation$CreatePost!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$CreatePost =
    Future<QueryResult<Mutation$CreatePost>> Function(
      GraphQLClient client,
      Options$Mutation$CreatePost options,
    );

@visibleForTesting
Myapp$Mutation$CreatePost? debugOverride$Myapp$Mutation$CreatePost;

Future<QueryResult<Mutation$CreatePost>> _myapp$Mutation$CreatePostImpl(
  GraphQLClient client,
  Options$Mutation$CreatePost options,
) {
  return client.mutate$CreatePost(options);
}

typedef Myapp$Mutation$CreatePost$HookResult = Mutation$CreatePost$HookResult;

Myapp$Mutation$CreatePost$HookResult useMyapp$Mutation$CreatePost([
  WidgetOptions$Mutation$CreatePost? options,
]) {
  UseMyapp$Mutation$CreatePost impl = _useMyapp$Mutation$CreatePostImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$CreatePost != null) {
      impl = debugOverride$UseMyapp$Mutation$CreatePost!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$CreatePost =
    Myapp$Mutation$CreatePost$HookResult Function([
      WidgetOptions$Mutation$CreatePost? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$CreatePost? debugOverride$UseMyapp$Mutation$CreatePost;

Myapp$Mutation$CreatePost$HookResult _useMyapp$Mutation$CreatePostImpl([
  WidgetOptions$Mutation$CreatePost? options,
]) {
  return useMutation$CreatePost(options);
}

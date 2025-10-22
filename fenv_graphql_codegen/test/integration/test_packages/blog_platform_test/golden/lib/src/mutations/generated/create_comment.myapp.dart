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
import 'package:blog_platform_test/src/mutations/generated/create_comment.graphql.dart';

extension Myapp$Mutation$CreateComment$Extension on GraphQLClient {
  Future<QueryResult<Mutation$CreateComment>> myapp$Mutate$CreateComment(
    Options$Mutation$CreateComment options,
  ) {
    Myapp$Mutation$CreateComment impl = _myapp$Mutation$CreateCommentImpl;
    assert(() {
      if (debugOverride$Myapp$Mutation$CreateComment != null) {
        impl = debugOverride$Myapp$Mutation$CreateComment!;
      }
      return true;
    }());
    return impl(this, options);
  }
}

typedef Myapp$Mutation$CreateComment =
    Future<QueryResult<Mutation$CreateComment>> Function(
      GraphQLClient client,
      Options$Mutation$CreateComment options,
    );

@visibleForTesting
Myapp$Mutation$CreateComment? debugOverride$Myapp$Mutation$CreateComment;

Future<QueryResult<Mutation$CreateComment>> _myapp$Mutation$CreateCommentImpl(
  GraphQLClient client,
  Options$Mutation$CreateComment options,
) {
  return client.mutate$CreateComment(options);
}

typedef Myapp$Mutation$CreateComment$HookResult =
    Mutation$CreateComment$HookResult;

Myapp$Mutation$CreateComment$HookResult useMyapp$Mutation$CreateComment([
  WidgetOptions$Mutation$CreateComment? options,
]) {
  UseMyapp$Mutation$CreateComment impl = _useMyapp$Mutation$CreateCommentImpl;
  assert(() {
    if (debugOverride$UseMyapp$Mutation$CreateComment != null) {
      impl = debugOverride$UseMyapp$Mutation$CreateComment!;
    }
    return true;
  }());
  return impl(options);
}

@visibleForTesting
typedef UseMyapp$Mutation$CreateComment =
    Myapp$Mutation$CreateComment$HookResult Function([
      WidgetOptions$Mutation$CreateComment? options,
    ]);

@visibleForTesting
UseMyapp$Mutation$CreateComment? debugOverride$UseMyapp$Mutation$CreateComment;

Myapp$Mutation$CreateComment$HookResult _useMyapp$Mutation$CreateCommentImpl([
  WidgetOptions$Mutation$CreateComment? options,
]) {
  return useMutation$CreateComment(options);
}

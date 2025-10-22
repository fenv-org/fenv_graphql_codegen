import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:fenv_graphql_core/src/strict_fetch_more.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Extension on [TypedUpdateQuery] to convert it to an [UpdateQuery] function.
extension TypedUpdateQueryConverter<TParsed> on TypedUpdateQuery<TParsed> {
  /// Converts to a [UpdateQuery] function.
  ///
  /// To achieve this, you need to provide the [fromJson] and [toJson] functions
  /// for serializing and deserializing the [TParsed] type.
  UpdateQuery toUpdateQuery({
    required TParsed Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(TParsed) toJson,
  }) {
    return (prev, next) {
      if (prev == null) return next;
      if (next == null) return prev;

      final prevData = fromJson(prev);
      final nextData = fromJson(next);
      return toJson(this(prevData, nextData));
    };
  }
}

/// Provides helper methods for implementing GraphQL query hooks.
class QueryHooksImplementationHelpers {
  /// Creates a query hook that subscribes to GraphQL query results.
  ///
  /// Mimics the behavior of useQueryOnClient from graphql_flutter by
  /// setting up an observable query with proper stream handling and callbacks.
  // @protected
  static (ObservableQuery<TParsed>, AsyncSnapshot<QueryResult<TParsed>>)
  useQueryOnClient<TParsed>(
    GraphQLClient client,
    QueryOptions<TParsed> options,
  ) {
    // NOTE: This function implementation is copied from "useQueryOnClient()"
    //       in "package:graphql_flutter/src/widgets/hooks/query.dart".
    final watchQueryOptions = useMemoized(() => options.asWatchQueryOptions(), [
      options,
    ]);
    final query = useWatchQueryOnClient(client, watchQueryOptions);
    final snapshot = useStream(query.stream, initialData: query.latestResult);

    useEffect(() {
      final cleanup = query.onData(
        QueryCallbackHandler(options: options).callbacks,
        removeAfterInvocation: false,
      );
      return cleanup;
    }, [options, query]);

    return (query, snapshot);
  }
}

import 'package:graphql/client.dart';

/// A function that fetches GraphQL query results.
///
/// Executes a query with the given [options] and optionally retries on
/// network errors when [retryOnNetworkError] is true.
typedef Fetcher<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
> =
    Future<QueryResult<TResult>> Function({
      required TOptions options,
      required bool retryOnNetworkError,
    });

/// Factory interface for creating [Fetcher] instances.
///
/// Provides static helpers for wrapping query operations with optional
/// retry logic for network errors.
abstract interface class FetcherFactory<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
> {
  /// Creates a factory from a supplier function.
  factory FetcherFactory.fromSupplier(
    FetcherFactory<TResult, TOptions> Function() supplier,
  ) => _FetcherFactoryWrapper<TResult, TOptions>(supplier);

  /// The fetcher instance produced by this factory.
  Fetcher<TResult, TOptions> get fetcher;

  /// Wraps a query operation to create a fetcher with required options.
  ///
  /// The resulting fetcher automatically retries once on network errors when
  /// [retryOnNetworkError] is true.
  static Future<QueryResult<TResult>> Function({
    required TOptions options,
    required bool retryOnNetworkError,
  })
  withRequiredOptions<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?
  >(Future<QueryResult<TResult>> Function(TOptions options) operation) {
    return ({required options, required retryOnNetworkError}) =>
        retryOnNetworkError
        ? _withRetry(operation, options)
        : _withNoRetry(operation, options);
  }

  /// Wraps a query operation to create a fetcher with nullable options.
  ///
  /// Similar to [withRequiredOptions] but allows the options parameter to be
  /// optional in the wrapped operation.
  static Future<QueryResult<TResult>> Function({
    TOptions options,
    // ignore: always_put_required_named_parameters_first
    required bool retryOnNetworkError,
  })
  withNullableOptions<
    TResult extends Object,
    TOptions extends QueryOptions<TResult>?
  >(Future<QueryResult<TResult>> Function([TOptions? options]) operation) {
    return ({required retryOnNetworkError, TOptions? options}) =>
        retryOnNetworkError
        ? _withRetry(operation, options)
        : _withNoRetry(operation, options);
  }
}

Future<QueryResult<TResult>>
_withNoRetry<TResult extends Object, TOptions extends QueryOptions<TResult>?>(
  Future<QueryResult<TResult>> Function(TOptions options) makeRequest,
  TOptions options,
) => makeRequest(options);

Future<QueryResult<TResult>>
_withRetry<TResult extends Object, TOptions extends QueryOptions<TResult>?>(
  Future<QueryResult<TResult>> Function(TOptions options) makeRequest,
  TOptions options,
) async {
  final firstQueryResult = await makeRequest(options);
  var queryResult = firstQueryResult;
  final needsSecondTry =
      queryResult.hasException && queryResult.exception?.linkException != null;

  if (needsSecondTry) {
    await Future.delayed(_retryBackoffDuration);
    queryResult = await makeRequest(
      options,
    ).timeout(_retryTimeoutDuration, onTimeout: () => firstQueryResult);
  }

  return queryResult;
}

const _retryBackoffDuration = Duration(milliseconds: 100);
const _retryTimeoutDuration = Duration(seconds: 1);

final class _FetcherFactoryWrapper<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
>
    implements FetcherFactory<TResult, TOptions> {
  const _FetcherFactoryWrapper(this.supplier);

  final FetcherFactory<TResult, TOptions> Function() supplier;

  @override
  Future<QueryResult<TResult>> Function({
    required TOptions options,
    required bool retryOnNetworkError,
  })
  get fetcher => supplier().fetcher;
}

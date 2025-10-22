import 'package:graphql/client.dart';

typedef Fetcher<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
> =
    Future<QueryResult<TResult>> Function({
      required TOptions options,
      required bool retryOnNetworkError,
    });

abstract interface class FetcherFactory<
  TResult extends Object,
  TOptions extends QueryOptions<TResult>?
> {
  factory FetcherFactory.fromSupplier(
    FetcherFactory<TResult, TOptions> Function() supplier,
  ) => _FetcherFactoryWrapper<TResult, TOptions>(supplier);

  Fetcher<TResult, TOptions> get fetcher;

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

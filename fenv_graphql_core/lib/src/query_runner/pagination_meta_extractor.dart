/// Extracts pagination metadata from GraphQL query results.
///
/// Provides methods to extract pagination information following the Relay
/// cursor-based pagination pattern, including nodes, cursors, and extra fields.
abstract interface class PaginationMetaExtractor<
  TResult extends Object,
  TNode extends Object,
  TExtra
> {
  /// Whether more pages are available after the current page.
  bool hasNextPage(TResult query);

  /// The cursor for fetching the next page.
  String? endCursor(TResult query);

  /// The list of data nodes in the current page.
  Iterable<TNode> nodes(TResult query);

  /// Extra fields from the query result alongside the connection.
  TExtra extra(TResult query);
}

/// Factory interface for creating [PaginationMetaExtractor] instances.
abstract interface class PaginationMetaExtractorFactory<
  TResult extends Object,
  TNode extends Object,
  TExtra
> {
  /// Creates a factory from a supplier function.
  factory PaginationMetaExtractorFactory.fromSupplier(
    PaginationMetaExtractorFactory<TResult, TNode, TExtra> Function() supplier,
  ) => _PaginationMetaExtractorFactoryWrapper<TResult, TNode, TExtra>(supplier);

  /// The extractor instance produced by this factory.
  PaginationMetaExtractor<TResult, TNode, TExtra> get extractor;
}

final class _PaginationMetaExtractorFactoryWrapper<
  TResult extends Object,
  TNode extends Object,
  TExtra
>
    implements PaginationMetaExtractorFactory<TResult, TNode, TExtra> {
  const _PaginationMetaExtractorFactoryWrapper(this.supplier);

  final PaginationMetaExtractorFactory<TResult, TNode, TExtra> Function()
  supplier;

  @override
  PaginationMetaExtractor<TResult, TNode, TExtra> get extractor =>
      supplier().extractor;
}

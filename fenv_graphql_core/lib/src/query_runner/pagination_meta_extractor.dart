import 'package:barrel_files_annotation/barrel_files_annotation.dart';

@includeInBarrelFile
abstract interface class PaginationMetaExtractor<
  TResult extends Object,
  TNode extends Object,
  TExtra
> {
  bool hasNextPage(TResult query);
  String? endCursor(TResult query);
  Iterable<TNode> nodes(TResult query);
  TExtra extra(TResult query);
}

@includeInBarrelFile
abstract interface class PaginationMetaExtractorFactory<
  TResult extends Object,
  TNode extends Object,
  TExtra
> {
  factory PaginationMetaExtractorFactory.fromSupplier(
    PaginationMetaExtractorFactory<TResult, TNode, TExtra> Function() supplier,
  ) => _PaginationMetaExtractorFactoryWrapper<TResult, TNode, TExtra>(supplier);

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

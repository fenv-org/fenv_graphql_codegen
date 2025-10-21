import 'package:build/build.dart';

extension BuilderOptionsExtension on BuilderOptions {
  String get targetFileExtension =>
      config['target_file_extension'] as String? ?? '.graphql.dart';

  String get symbolNamePrefix =>
      config['symbol_name_prefix'] as String? ?? 'fenv';

  String get filenameSuffix => config['filename_suffix'] as String? ?? 'fenv';

  bool get shouldFormat => config['format'] as bool? ?? true;

  bool shouldAccept(String path) => path.endsWith(targetFileExtension);

  RegExp get targetFileExtensionAsRegExp =>
      RegExp('${targetFileExtension.replaceAll('.', r'\.')}\$');

  String generateHookOutputPath(String path) =>
      path.replaceFirst(targetFileExtensionAsRegExp, '.$filenameSuffix.dart');

  String generateMockOutputPath(String path) => path
      .replaceFirst(targetFileExtensionAsRegExp, '.$filenameSuffix.mocks.dart')
      .replaceFirst('lib/', 'test/');
}

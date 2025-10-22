import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  group('Blog Platform Integration Tests', () {
    late Directory testPackageDir;

    setUpAll(() {
      // Get test package directory at repository root
      final currentDir = Directory.current.path;

      // Navigate to repository root (currentDir is fenv_graphql_codegen/)
      // We need to go up one level to reach the repository root
      final repoRoot = path.dirname(currentDir);

      testPackageDir = Directory(
        path.join(
          repoRoot,
          'test_packages',
          'blog_platform_test',
        ),
      );

      expect(
        testPackageDir.existsSync(),
        isTrue,
        reason: 'Test package directory not found: ${testPackageDir.path}',
      );
    });

    test('test package structure is correct', () {
      // Verify schema exists
      final schemaFile = File(
        path.join(testPackageDir.path, 'lib', 'schema.graphql'),
      );
      expect(
        schemaFile.existsSync(),
        isTrue,
        reason: 'schema.graphql not found',
      );

      // Verify fragment files exist
      final fragmentFiles = [
        'lib/src/features/page_info/page_info.graphql',
        'lib/src/features/author/author_fragment.graphql',
        'lib/src/features/post_card/post_card.graphql',
        'lib/src/features/comment/comment_fragment.graphql',
        'lib/src/features/category/category_fragment.graphql',
      ];

      for (final fragmentPath in fragmentFiles) {
        final file = File(path.join(testPackageDir.path, fragmentPath));
        expect(file.existsSync(), isTrue, reason: '$fragmentPath not found');
      }

      // Verify query files exist
      final queryFiles = [
        'lib/src/screens/post_list/post_list_screen.graphql',
        'lib/src/screens/post_detail/post_detail_screen.graphql',
        'lib/src/screens/profile/profile_screen.graphql',
        'lib/src/screens/trending_posts/trending_posts_screen.graphql',
        'lib/src/screens/recommended_posts/recommended_posts_screen.graphql',
        'lib/src/screens/author_posts/author_posts_screen.graphql',
      ];

      for (final queryPath in queryFiles) {
        final file = File(path.join(testPackageDir.path, queryPath));
        expect(file.existsSync(), isTrue, reason: '$queryPath not found');
      }

      // Verify mutation files exist
      final mutationFiles = [
        'lib/src/mutations/create_post.graphql',
        'lib/src/mutations/like_post.graphql',
        'lib/src/mutations/follow_author.graphql',
        'lib/src/mutations/create_comment.graphql',
      ];

      for (final mutationPath in mutationFiles) {
        final file = File(path.join(testPackageDir.path, mutationPath));
        expect(file.existsSync(), isTrue, reason: '$mutationPath not found');
      }

      // Verify config files
      final pubspecFile = File(path.join(testPackageDir.path, 'pubspec.yaml'));
      expect(
        pubspecFile.existsSync(),
        isTrue,
        reason: 'pubspec.yaml not found',
      );

      final buildFile = File(path.join(testPackageDir.path, 'build.yaml'));
      expect(buildFile.existsSync(), isTrue, reason: 'build.yaml not found');
    });

    test('pub get succeeds', () async {
      await _cleanGeneratedFiles(testPackageDir);

      final result = await Process.run('dart', [
        'pub',
        'get',
      ], workingDirectory: testPackageDir.path);

      print('pub get stdout: ${result.stdout}');
      if (result.exitCode != 0) {
        print('pub get stderr: ${result.stderr}');
      }

      expect(
        result.exitCode,
        equals(0),
        reason: 'pub get failed: ${result.stderr}',
      );
    }, timeout: Timeout(Duration(minutes: 2)));

    test('build_runner generates files', () async {
      await _cleanGeneratedFiles(testPackageDir);
      await _runPubGet(testPackageDir);

      final result = await Process.run('dart', [
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs',
      ], workingDirectory: testPackageDir.path);

      print('build_runner stdout: ${result.stdout}');
      if (result.exitCode != 0) {
        print('build_runner stderr: ${result.stderr}');
      }

      expect(
        result.exitCode,
        equals(0),
        reason: 'build_runner failed: ${result.stderr}',
      );

      // Check that some generated files exist
      final genDir = Directory(
        path.join(testPackageDir.path, 'lib', 'gen', 'graphql'),
      );

      if (genDir.existsSync()) {
        final generatedFiles = genDir
            .listSync(recursive: true)
            .whereType<File>()
            .where((f) => f.path.endsWith('.dart'))
            .toList();

        expect(
          generatedFiles,
          isNotEmpty,
          reason: 'No generated .dart files found in ${genDir.path}',
        );

        print('Generated ${generatedFiles.length} files');
        for (final file in generatedFiles.take(5)) {
          print('  - ${path.relative(file.path, from: testPackageDir.path)}');
        }
      }
    }, timeout: Timeout(Duration(minutes: 3)));

    test(
      'generated code has no analysis errors',
      () async {
        await _cleanGeneratedFiles(testPackageDir);
        await _runPubGet(testPackageDir);
        await _runBuildRunner(testPackageDir);

        final analyzeResult = await Process.run('dart', [
          'analyze',
          '--fatal-infos',
        ], workingDirectory: testPackageDir.path);

        print('analyze stdout: ${analyzeResult.stdout}');
        if (analyzeResult.exitCode != 0) {
          print('analyze stderr: ${analyzeResult.stderr}');
        }

        expect(
          analyzeResult.exitCode,
          equals(0),
          reason: 'Generated code has analysis errors: ${analyzeResult.stdout}',
        );
      },
      timeout: Timeout(Duration(minutes: 3)),
    );

    test('fragments are properly nested', () async {
      // Verify that PostCard fragment references AuthorInfoBase
      final postCardFile = File(
        path.join(
          testPackageDir.path,
          'lib/src/features/post_card/post_card.graphql',
        ),
      );
      final postCardContent = postCardFile.readAsStringSync();

      expect(postCardContent, contains('...AuthorInfoBase'));
      expect(postCardContent, contains('fragment PostCard on Post'));
      expect(postCardContent, contains('fragment PostCardBase on Post'));

      // Verify that AuthorInfo has nested structure
      final authorFile = File(
        path.join(
          testPackageDir.path,
          'lib/src/features/author/author_fragment.graphql',
        ),
      );
      final authorContent = authorFile.readAsStringSync();

      expect(authorContent, contains('...AuthorInfoBase'));
      expect(authorContent, contains('fragment AuthorInfo on User'));
      expect(authorContent, contains('fragment AuthorInfoBase on User'));
      expect(authorContent, contains('@include(if: \$withDetails)'));
    });

    test('generated files match golden files', () async {
      await _cleanGeneratedFiles(testPackageDir);
      await _runPubGet(testPackageDir);
      await _runBuildRunner(testPackageDir);

      final goldenDir = Directory(path.join(testPackageDir.path, 'golden'));
      expect(
        goldenDir.existsSync(),
        isTrue,
        reason: 'Golden directory not found: ${goldenDir.path}',
      );

      // Find all *.myapp.dart files in lib/
      final libMyappFiles = Directory(path.join(testPackageDir.path, 'lib'))
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.myapp.dart'))
          .toList();

      print('Found ${libMyappFiles.length} .myapp.dart files in lib/');

      for (final generatedFile in libMyappFiles) {
        final relativePath = path.relative(
          generatedFile.path,
          from: testPackageDir.path,
        );
        final goldenFile = File(path.join(goldenDir.path, relativePath));

        expect(
          goldenFile.existsSync(),
          isTrue,
          reason: 'Golden file not found for $relativePath',
        );

        final generatedContent = generatedFile.readAsStringSync();
        final goldenContent = goldenFile.readAsStringSync();

        expect(
          generatedContent,
          equals(goldenContent),
          reason: 'Generated file does not match golden file: $relativePath',
        );
      }

      // Find all *.myapp.mocks.dart files in test/
      final testMockFiles = Directory(path.join(testPackageDir.path, 'test'))
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.myapp.mocks.dart'))
          .toList();

      print('Found ${testMockFiles.length} .myapp.mocks.dart files in test/');

      for (final generatedFile in testMockFiles) {
        final relativePath = path.relative(
          generatedFile.path,
          from: testPackageDir.path,
        );
        final goldenFile = File(path.join(goldenDir.path, relativePath));

        expect(
          goldenFile.existsSync(),
          isTrue,
          reason: 'Golden file not found for $relativePath',
        );

        final generatedContent = generatedFile.readAsStringSync();
        final goldenContent = goldenFile.readAsStringSync();

        expect(
          generatedContent,
          equals(goldenContent),
          reason: 'Generated file does not match golden file: $relativePath',
        );
      }
    }, timeout: Timeout(Duration(minutes: 3)));
  });
}

// Helper functions
Future<void> _cleanGeneratedFiles(Directory dir) async {
  final result = await Process.run('dart', [
    'run',
    'build_runner',
    'clean',
  ], workingDirectory: dir.path);
  // Clean can fail if no previous build, that's ok
  print('clean result: ${result.exitCode}');
}

Future<ProcessResult> _runPubGet(Directory dir) async {
  return await Process.run('dart', ['pub', 'get'], workingDirectory: dir.path);
}

Future<ProcessResult> _runBuildRunner(Directory dir) async {
  await Process.run('dart', [
    'run',
    'build_runner',
    'clean',
  ], workingDirectory: dir.path);
  return await Process.run('dart', [
    'run',
    'build_runner',
    'build',
    '--delete-conflicting-outputs',
  ], workingDirectory: dir.path);
}

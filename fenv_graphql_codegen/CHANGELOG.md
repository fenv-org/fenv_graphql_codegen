## 0.2.0

- **BREAKING**: Migrate to analyzer element2 API.
  - Update analyzer dependency to ^7.7.1.
  - All code now uses element2 API (`Element2`, `name3`, `importedLibraries2`,
    etc.).
- Update dependencies:
  - `build`: ^4.0.0
  - `dart_style`: ^3.1.0
- Enhance README with comprehensive builder configuration guide:
  - Document the two builders (`fenv_graphql_codegen` and
    `fenv_graphql_mocks_codegen`).
  - Add detailed configuration examples with both builders.
  - Clarify what gets generated and where.

## 0.1.1

- Relocate integration test package from
  `fenv_graphql_codegen/test/integration/test_packages/` to `test_packages/` at
  repository root for better maintenance and separation.
- Update `.gitignore` to exclude Dart build artifacts (`.dart_tool/`, `*.lock`,
  `build/`).

## 0.1.0

- Update to analyzer v8.1.1 and adapt code to new API.
- Fix enum type import detection in code generator for pagination extra fields.
- Add golden file integration tests to catch regressions.
- Add script to update golden files (`tools/update_golden_files.sh`).
- Add `invalid_null_aware_operator` lint ignore to generated code.
- Update test dependencies.

## 0.0.0+3

- Update topics: use `codegen` instead of `graphql_codegen`.

## 0.0.0+2

- Update topics: use `graphql_codegen` instead of `codegen` and reorganize
  order.

## 0.0.0+1

- Add package description and topics for better pub.dev discoverability.

## 0.0.0

- Initial version.

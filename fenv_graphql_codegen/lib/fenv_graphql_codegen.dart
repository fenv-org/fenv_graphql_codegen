/// A Dart code generator that creates test-friendly wrappers and mock
/// implementations for GraphQL operations.
///
/// This package provides two builders:
/// - `fenv_graphql_codegen`: Generates production wrapper code
/// - `fenv_graphql_mocks_codegen`: Generates mock implementations for testing
library;

export 'package:graphql_codegen/builder.dart' show GraphQLBuilder;
export 'src/fenv_graphql_wrapper_builder.dart'
    show fenvGraphqlWrapperBuilderFactory;
export 'src/fenv_graphql_mock_builder.dart' show fenvGraphqlMockBuilderFactory;

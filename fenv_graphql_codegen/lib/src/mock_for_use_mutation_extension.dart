import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:fenv_graphql_codegen/src/contents.dart';
import 'package:fenv_graphql_codegen/src/hook_for_use_mutation_extension.dart';
import 'package:fenv_graphql_codegen/src/parameter_elements_extension.dart';

extension MockForUseMutationExtension on TopLevelFunctionElement {
  List<String> generateMockForUseMutation(
    BuilderOptions options,
    Contents reference,
  ) {
    return [
      'abstract base class Mock${useFenvMutationHookWrapperInterfaceName(options)} {',
      '  void install() {',
      '    ${useFenvMutationHookDebugOverrideName(options)} = this;',
      '  }',
      '',
      '  void uninstall() {',
      '    ${useFenvMutationHookDebugOverrideName(options)} = null;',
      '  }',
      '',
      '  ${fenvHookResultTypeName(options)} call(',
      '    ${formalParameters.parametersToString()}',
      '  );',
      '}',
    ];
  }
}

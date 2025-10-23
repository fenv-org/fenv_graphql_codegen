import 'package:analyzer/dart/element/element2.dart';

class Contents {
  Contents({
    required this.inputLibrary,
    required this.extensions,
    required this.functions,
    required this.classes,
    required this.importedLibraries,
  });

  LibraryElement2 inputLibrary;
  Uri get uri => inputLibrary.uri;
  final Map<String, ExtensionElement2> extensions;
  final Map<String, TopLevelFunctionElement> functions;
  final Map<String, ClassElement2> classes;
  final List<LibraryElement2> importedLibraries;

  ExtensionElement2? findExtensionByName(String name) {
    return extensions['ClientExtension\$$name'];
  }
}

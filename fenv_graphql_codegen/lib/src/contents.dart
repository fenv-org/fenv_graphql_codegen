import 'package:analyzer/dart/element/element.dart';

class Contents {
  Contents({
    required this.inputLibrary,
    required this.extensions,
    required this.functions,
    required this.classes,
    required this.importedLibraries,
  });

  LibraryElement inputLibrary;
  Uri get uri => inputLibrary.librarySource.uri;
  final Map<String, ExtensionElement> extensions;
  final Map<String, FunctionElement> functions;
  final Map<String, ClassElement> classes;
  final List<LibraryElement> importedLibraries;

  ExtensionElement? findExtensionByName(String name) {
    return extensions['ClientExtension\$$name'];
  }
}

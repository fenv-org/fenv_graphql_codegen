import 'package:analyzer/dart/element/element.dart';

extension ClientExtension on ExtensionElement {
  bool get isQueryClientExtension =>
      name?.startsWith('ClientExtension\$Query\$') ?? false;

  bool get isMutationClientExtension =>
      name?.startsWith('ClientExtension\$Mutation\$') ?? false;
}

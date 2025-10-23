import 'package:analyzer/dart/element/element2.dart';

extension ClientExtension on ExtensionElement2 {
  bool get isQueryClientExtension =>
      name3?.startsWith('ClientExtension\$Query\$') ?? false;

  bool get isMutationClientExtension =>
      name3?.startsWith('ClientExtension\$Mutation\$') ?? false;
}

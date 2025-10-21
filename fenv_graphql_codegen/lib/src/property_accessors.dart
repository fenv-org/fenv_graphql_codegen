extension PropertyAccessors on dynamic {
  Iterable<Map<String, dynamic>> get functions =>
      (this['functions'] as List<dynamic>).whereType<Map<String, dynamic>>();
  String get uri => this['uri'] as String;
  String get name => this['name'] as String;
  Iterable<Map<String, dynamic>> get parameters =>
      (this['parameters'] as List<dynamic>).whereType<Map<String, dynamic>>();
  String get returnType => this['returnType'] as String;
  int get index => this['index'] as int;
  bool get isPositional => this['positional'] as bool;
  bool get isNamed => this['named'] as bool;
  bool get isRequired => this['required'] as bool;
  bool get isOptional => this['optional'] as bool;
  String? get defaultValue => this['defaultValue'] as String?;
  String get type => this['type'] as String;

  Iterable<Map<String, dynamic>> get classes =>
      (this['classes'] as List<dynamic>).whereType<Map<String, dynamic>>();
  Iterable<Map<String, dynamic>> get constructors =>
      (this['constructors'] as List<dynamic>).whereType<Map<String, dynamic>>();
}

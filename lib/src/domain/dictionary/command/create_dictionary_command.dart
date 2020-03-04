import 'package:dynamic_properties/dynamic_properties.dart';

abstract class CreateDictionaryCommand {
  String get title;
  static CreateDictionaryCommand create(
    String title,
  ) =>
      _CreateDictionaryCommand({'title': title});
}

class _CreateDictionaryCommand
    with DynamicProperties
    implements CreateDictionaryCommand {
  _CreateDictionaryCommand(Map<String, dynamic> props) {
    defineProperties(props);
  }
}

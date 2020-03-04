import 'package:dynamic_properties/dynamic_properties.dart';

abstract class DictionaryCreatedEvent {
  String get aggregateIdentifier;
  String get title;

  static DictionaryCreatedEvent create(String aggregateIdentifier,
          {String title}) =>
      _DictionaryCreatedEvent({
        "aggregateIdentifier": aggregateIdentifier,
        "title": title,
      });
}

class _DictionaryCreatedEvent
    with DynamicProperties
    implements DictionaryCreatedEvent {
  _DictionaryCreatedEvent(Map<String, dynamic> props) {
    defineProperties(props);
  }
}

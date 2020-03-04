import 'package:flutter_test/flutter_test.dart';
import 'package:dart_event_sourcing_test/dart_event_sourcing_test.dart';

import 'package:app/domain_dictionary.dart';

void main() {
  group("Dictionary", () {
    AggregateTestFixture<Dictionary> fixture;
    setUp(() {
      fixture = AggregateTestFixture<Dictionary>(() => Dictionary());
    });
    test("create command can set DictionaryManager's initial state.", () {
      String aggregateId;
      const NEW_DICTIONARY_TITLE = 'new dictionary';
      final aggregateIdIsGenerated = (Dictionary aggregate) {
        aggregateId = aggregate.aggregateId;
        expect(aggregateId.isNotEmpty, true);
      };
      final propertiesOfDictionaryAreSetProperly = (Dictionary dictionary) {
        expect(dictionary.title, NEW_DICTIONARY_TITLE);
      };
      final expectedEvents = [
        DictionaryCreatedEvent.create(aggregateId, title: NEW_DICTIONARY_TITLE)
      ];
      fixture
          .givenNoPriorActivity()
          .when(CreateDictionaryCommand.create(NEW_DICTIONARY_TITLE))
          .expectState(aggregateIdIsGenerated)
          .expectEvents(expectedEvents)
          .expectState(propertiesOfDictionaryAreSetProperly);
    });
  });
}

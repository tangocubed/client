import 'package:flutter_test/flutter_test.dart';
import 'package:dart_event_sourcing/eventstore.dart';
import 'package:dart_event_sourcing/modeling.dart';

import 'package:app/feature_dictionary_manager.dart';

class AggregateTestFixture<T extends Aggregate> {
  T Function() aggregateProvider;
  EventStore eventStore;
  AggregateTestFixture(
    this.aggregateProvider, { EventStore eventStore }
  ) {
    this.eventStore = eventStore ?? InMemoryEventStore();
  }
  void givenNoPriorActivity() {

  }
}

void main() {
  group("DictionaryManager", () {
    EventStore eventStore;
    AggregateTestFixture<DictionaryManagerModel> fixture;

    setUp(() {
      fixture = AggregateTestFixture(() => DictionaryManagerModel());
    });

    test("create command can set DictionaryManager's initial state.", () {
      fixture
      .givenNoPriorActivity()
      .`when`(createDictionaryCommand)
      .expectState { aggregate ->
        aggregateId = aggregate.aggregateId
      }
    .expectEvents(dictionaryCreatedEvent(aggregateId))
    .expectState { aggregate -> assertAll(
       Executable { assertEquals(title, aggregate.title) },
            Executable { assertEquals(aggregateId, aggregate.aggregateId) }
        )}
      scenario
      .when(querySucceeded)
      .thenEmitt(Event())

      const viewModel = ViewModel.create()

      viewModel.on(event);
      expect(viewModel.dictionaries.length, 3);
    });
  });
}
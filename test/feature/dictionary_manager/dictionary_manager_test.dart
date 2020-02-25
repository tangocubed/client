import 'package:flutter_test/flutter_test.dart';

class OnMemoryEventStore extends EventStore {

  static OnMemoryEventStore create() {
    return OnMemoryEventStore();
  }

  @override
  add(event) {
    throw UnimplementedError();
  }
}

abstract class EventStore {
  add(dynamic event);
}

class AggregateTestFixture<T> {
  AggregateTestFixture(T Function() provider);
}

class DictionaryManagerModel {

}

void main() {
  group("DictionaryManager", () {
    EventStore eventStore;
    AggregateTestFixture<DictionaryManagerModel> fixture;

    setUp(() {
      fixture = AggregateTestFixture(DictionaryManagerModel.class)
      eventStore = OnMemoryEventStore.create();
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
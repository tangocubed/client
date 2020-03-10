import 'package:dart_event_sourcing/commandhandling.dart';
import 'package:dart_event_sourcing/eventhandling.dart';
import 'dictionary.dart';
import 'command/create_dictionary_command.dart';

class DictionaryRepository implements Repository<Dictionary> {
  final EventStore eventStore;
  DictionaryRepository(this.eventStore);
  @override
  AggregateProxy<Dictionary> load(String aggregateIdentifier, {int expectedVersion = null}) {
    final entity = Dictionary();
    final aggregate = DictionaryAggregate(entity);
    eventStore.readsEvents(aggregateIdentifier).forEach((event) {
      aggregate.handleEvent(event);
    });
    return aggregate;
  }

  @override
  AggregateProxy<Dictionary> newInstance(Dictionary Function() factoryMethod) {
    Dictionary aggregate = factoryMethod();
    return DictionaryAggregate(aggregate);
  }
}

class DictionaryAggregate extends AggregateProxy<Dictionary>{
  DictionaryAggregate(Dictionary aggregate): super(aggregate);
  @override
  bool get deleted => false;

  @override
  handleCommand(CommandMessage command) {
    if (command.payload is CreateDictionaryCommand) {

    }
  }

  @override
  handleEvent(DomainEventMessage event) {
    // TODO: implement handleEvent
    throw UnimplementedError();
  }

  @override
  // TODO: implement identifierAsString
  String get identifierAsString => throw UnimplementedError();

  @override
  // TODO: implement rootType
  Type get rootType => throw UnimplementedError();

  @override
  // TODO: implement type
  String get type => throw UnimplementedError();

  @override
  // TODO: implement version
  int get version => throw UnimplementedError();
}
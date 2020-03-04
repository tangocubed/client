import 'package:uuid/uuid.dart';
import 'package:dart_event_sourcing/modeling.dart';
import 'package:dart_event_sourcing/commandhandling.dart';

import 'package:app/domain_dictionary.dart';

@Aggregate()
class Dictionary {
  @AggregateIdentifier()
  String aggregateId;

  @AggregateVersion()
  int aggregateVersion;

  String title;

  Dictionary();

  @CommandHandler()
  Dictionary.create(CreateDictionaryCommand command) {
    this.aggregateId = Uuid().toString();
    this.title = command.title;
    AggregateLifecycle.apply(DictionaryCreatedEvent.create(
      this.aggregateId,
      title: this.title,
    ));
  }
}

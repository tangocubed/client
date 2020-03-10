// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AggregateCommandHandlerGenerator
// **************************************************************************

import 'command/create_dictionary_command.dart';

import 'dictionary.dart';
import 'package:dart_event_sourcing/commandhandling.dart';

/// A handler class for dictionary aggregates.
class DictionaryCommandHandler {
  Repository<Dictionary> repository;
  DictionaryCommandHandler(this.repository);

  void handle(dynamic command) {
    if (command is CreateDictionaryCommand) {
      return handleCreateDictionaryCommand(command);
    }
    else throw Exception("Unknown command: $command");
  }

  void handleCreateDictionaryCommand(CreateDictionaryCommand command) {
    repository.newInstance(() => Dictionary.create(command));
  }
}

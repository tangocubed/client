
import 'package:dart_event_sourcing/modeling.dart';

@Aggregate()
class DictionaryMangerModel {
  @AggregateIdentifier()
  String modelId;
}


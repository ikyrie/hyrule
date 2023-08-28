import 'package:hyrule/domain/models/entry.dart';

abstract class DaoWorkflow {
  Future<List<Entry>> getSavedEntries();

  Future<void> addEntry({required Entry entry});

  Future<void> removeEntry({required Entry entry});
}

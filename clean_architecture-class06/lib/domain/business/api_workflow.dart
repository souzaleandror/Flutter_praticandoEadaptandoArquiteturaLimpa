import '../models/entry.dart';

abstract class ApiWorkflow {
  Future<List<Entry>> getEntriesByCategory({required String category});
}

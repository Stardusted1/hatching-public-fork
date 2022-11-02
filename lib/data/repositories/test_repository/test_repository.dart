import 'package:hatching/domain/test_item/test_item.cg.dart';

abstract class ITestsRepository {
  Future<List<BaseTestItem>> fetchItems();

  Future<List<BaseTestItem>> fetchSearchResults(String query);

  Future<TestSingleItem> fetchTestDetailsById(String id);
}

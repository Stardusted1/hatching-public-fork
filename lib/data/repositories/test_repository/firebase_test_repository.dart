import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hatching/data/repositories/test_repository/test_repository.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'dart:developer' as dev;
import 'package:logging/logging.dart';

class FirebaseTestRepository implements ITestsRepository {
  final firebase = FirebaseFirestore.instance;
  static const collectionName = 'tests';

  @override
  Future<List<BaseTestItem>> fetchItems() async {
    try {
      final collection = firebase.collection(collectionName);
      final data = await collection.get();
      final tests = data.docs.map((e) {
        final data = e.data();
        data["id"] = e.id;
        return TestSingleItem.fromJson(data);
      }).toList();
      return tests;
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }

  @override
  Future<List<BaseTestItem>> fetchSearchResults(String query) async {
    try {
      final collection = firebase.collection(collectionName);
      final data = await collection.get();
      final tests = data.docs.map((e) {
        final data = e.data();
        data["id"] = e.id;
        return TestSingleItem.fromJson(data);
      }).toList();
      return tests
          .where((e) => e.description.contains(query) || e.name.contains(query))
          .toList();
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }

  @override
  Future<TestSingleItem> fetchTestDetailsById(String id) async {
    try {
      final collection = firebase.collection(collectionName).doc(id);
      final data = await collection.get();
      final jsonData = data.data();
      jsonData!["id"] = data.id;
      return TestSingleItem.fromJson(jsonData);
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }
}

import 'dart:developer' as dev;
import 'package:hatching/domain/test_item/test_item.cg.dart';
import 'package:logging/logging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hatching/data/repositories/analytics_repository/analytics_repository.dart';
import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';

class FirebaseAnalyticsRepository extends IAnalyticsRepository {
  final firebase = FirebaseFirestore.instance;
  static const collectionName = 'test-results';

  FirebaseAnalyticsRepository();

  @override
  Future<List<AnalyticsItem>> fetchAnalytics(String userId) async {
    try {
      final collection = firebase.collection(collectionName);
      final data = await collection.where("userId", isEqualTo: userId).get();
      final analytics = data.docs.map((e) {
        final data = e.data();
        data["id"] = e.id;
        return AnalyticsItem.fromJson(data);
      }).toList();
      return analytics;
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }

  @override
  Future<AnalyticsItem> fetchAnalyticsDetails(String id) async {
    try {
      throw UnimplementedError();
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }

  @override
  Future<void> sendAnalytics(
    TestSingleItem test,
    AnalyticsItemDetails report,
    String userId,
  ) async {
    try {
      final collection = firebase.collection(collectionName).doc(test.id);
      final doc = await collection.get();
      if (doc.exists) {
        collection.update({
          "data": FieldValue.arrayUnion([report.toJson()])
        });
      } else {
        AnalyticsItem item = AnalyticsItem(
          id: test.id,
          userId: userId,
          description: test.description,
          name: test.name,
          data: [report],
        );
        collection.set(item.toJson());
      }
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s, level: Level.SHOUT.value);
      rethrow;
    }
  }
}

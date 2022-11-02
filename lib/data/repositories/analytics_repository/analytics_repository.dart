import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
import 'package:hatching/domain/test_item/test_item.cg.dart';

abstract class IAnalyticsRepository {
  const IAnalyticsRepository();

  Future<void> sendAnalytics(
    TestSingleItem test,
    AnalyticsItemDetails report,
    String userId,
  );

  Future<List<AnalyticsItem>> fetchAnalytics(String userId);

  Future<AnalyticsItem> fetchAnalyticsDetails(String id);
}

// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hatching/data/repositories/analytics_repository/analytics_repository.dart';
// import 'package:hatching/domain/analytics_item/analytics_item.cg.dart';
//
// class MockAnalyticsService implements IAnalyticsRepository {
//   List<AnalyticsItem> _items = List.generate(
//     5,
//     (i) {
//       final random = Random(DateTime.now().millisecond);
//       const minimum = 80;
//       const maximum = 100;
//       const delta = 10;
//       return AnalyticsItem(
//         id: "$i",
//         name: "name $i",
//         description: "description $i",
//         data: List.generate(
//           15,
//           (j) {
//             DateTime startTime = j % 5 < 3
//                 ? DateTime.now()
//                 : DateTime.now().subtract(Duration(days: j));
//             DateTime endTime = startTime.add(const Duration(seconds: 50));
//             return AnalyticsItemDetails(
//               accuracy: maximum + random.nextDouble() * (minimum - maximum),
//               meanAccuracy: random.nextDouble() * (minimum - delta),
//               duration: endTime.difference(startTime),
//               startTime: startTime,
//               endTime: endTime,
//               totalPoints: random.nextInt(2000),
//               totalErrors: random.nextInt(2000),
//               totalRetries: 20,
//             );
//           },
//           growable: true,
//         ),
//       );
//     },
//     growable: true,
//   );
//
//   @override
//   Future<List<AnalyticsItem>> fetchAnalytics() async {
//     await Future.delayed(const Duration(seconds: 1));
//     return _items;
//   }
//
//   @override
//   Future<AnalyticsItem> fetchAnalyticsDetails(String id) async {
//     await Future.delayed(const Duration(seconds: 1));
//     return _items.firstWhere((item) => item.id == id);
//   }
//
//   @override
//   Future<void> sendAnalytics(
//     String testId,
//     AnalyticsItemDetails report,
//     String userId,
//   ) async {
//     final item = _items.firstWhere(
//       (item) => item.id == testId,
//       orElse: () => _items.first,
//     );
//     item.data.add(report);
//   }
// }

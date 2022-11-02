// import 'dart:convert';
//
// import 'package:flutter/services.dart';
// import 'package:hatching/data/repositories/test_repository/test_repository.dart';
// import 'package:hatching/domain/test_item/test_item.cg.dart';
//
// class MockTestsService implements ITestsRepository {
//   late List<BaseTestItem> _items;
//
//   static List<BaseTestItem> initItems(String json) {
//     return [
//       ...List.generate(15, (i) {
//         if (i % 5 == 0) {
//           return TestMultipleItems(
//             id: "$i",
//             name: "Test List $i",
//             description: "description",
//             previewUrl: "https://picsum.photos/200",
//             items: List.generate(3, (j) {
//               return TestSingleItem(
//                 testGroup: "testGroup",
//                 testJson: json,
//                 id: "$i$j",
//                 name: "Test $i$j",
//                 description: "description",
//                 previewUrl: "https://picsum.photos/200?=$i$j",
//               );
//             }),
//           );
//         } else {
//           return TestSingleItem(
//             testGroup: "testGroup",
//             testJson: json,
//             id: "$i",
//             name: "Test $i",
//             description: "description",
//             previewUrl: "https://picsum.photos/200?=$i",
//           );
//         }
//       }),
//     ];
//   }
//
//   @override
//   Future<List<BaseTestItem>> fetchItems() async {
//     //todo image ratio 667 : 375
//     final va = await PlatformAssetBundle().loadString("assets/data.json");
//     final testSvg = Uri.decodeComponent(jsonDecode(va)['data']);
//     _items = initItems(testSvg);
//     await Future.delayed(const Duration(milliseconds: 500));
//     return _items;
//   }
//
//   @override
//   Future<List<BaseTestItem>> fetchSearchResults(String query) async {
//     return _items;
//   }
//
//   @override
//   Future<BaseTestItem> fetchTestItemById(String id) async {
//     return _items.firstWhere((item) => item.id == id);
//   }
//
//   @override
//   Future<TestSingleItem> fetchTestDetailsById(String id) async {
//     for (var item in _items) {
//       if (item is TestMultipleItems) {
//         for (var subItem in item.items) {
//           if (subItem.id == id) {
//             return subItem;
//           }
//         }
//       } else if (item is TestSingleItem) {
//         if (item.id == id) {
//           return item;
//         }
//       }
//     }
//     return _items.firstWhere((item) => item.id == id && item is TestSingleItem)
//         as TestSingleItem;
//   }
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>((ref) => 0);
final twonumProvider = StateProvider<int>((ref) => 0);
final threenumProvider = StateProvider<int>((ref) => 0);
final fournumProvider = StateProvider<int>((ref) => 0);
final fivenumProvider = StateProvider<int>((ref) => 0);
final sixnumProvider = StateProvider<int>((ref) => 0);
final sevenProvider = StateProvider<int>((ref) => 0);
final eightProvider = StateProvider<int>((ref) => 0);
final nineProvider = StateProvider<int>((ref) => 0);
final tenProvider = StateProvider<int>((ref) => 0);
final elevenProvider = StateProvider<int>((ref) => 0);
final twelveProvider = StateProvider<int>((ref) => 0);
final thirteenProvider = StateProvider<int>((ref) => 0);
final fourteenProvider = StateProvider<int>((ref) => 0);
final fifteenProvider = StateProvider<int>((ref) => 0);

// final numListProvider =
//     StateNotifierProvider<NumberListNotifier, List<NumberModel>>(
//         (ref) => NumberListNotifier());

// class NumberListNotifier extends StateNotifier<List<NumberModel>> {
//   NumberListNotifier()
//       : super([
//           NumberModel(
//             name: 1,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 2,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 3,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 4,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 5,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 6,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 7,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 8,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 9,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 10,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 11,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 12,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 13,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 14,
//             chkButton: false,
//           ),
//           NumberModel(
//             name: 15,
//             chkButton: false,
//           ),
//         ]);

//   void chkBtn({required int name}) {
//     state = state
//         .map((e) => //state 는 클래스 안의 상태
//             e.name == name
//                 ? NumberModel(
//                     name: e.name,
//                     chkButton: !e.chkButton,
//                   )
//                 : e)
//         .toList();
//   }
// }

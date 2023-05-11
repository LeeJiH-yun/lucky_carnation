import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_carnation/main/model/number_model.dart';

final numberProvider = StateProvider<int>((ref) => 0);
final twonumProvider = StateProvider<int>((ref) => 0);
// final numberProvider = StateProvider<int>((ref) => 2);
// final numberProvider = StateProvider<int>((ref) => 3);
// final numberProvider = StateProvider<int>((ref) => 4);
// final numberProvider = StateProvider<int>((ref) => 5);
// final numberProvider = StateProvider<int>((ref) => 6);
// final numberProvider = StateProvider<int>((ref) => 7);
// final numberProvider = StateProvider<int>((ref) => 8);
// final numberProvider = StateProvider<int>((ref) => 9);
// final numberProvider = StateProvider<int>((ref) => 10);
// final numberProvider = StateProvider<int>((ref) => 11);
// final numberProvider = StateProvider<int>((ref) => 12);
// final numberProvider = StateProvider<int>((ref) => 13);
// final numberProvider = StateProvider<int>((ref) => 14);
// final numberProvider = StateProvider<int>((ref) => 15);

final numListProvider =
    StateNotifierProvider<NumberListNotifier, List<NumberModel>>(
        (ref) => NumberListNotifier());

class NumberListNotifier extends StateNotifier<List<NumberModel>> {
  NumberListNotifier()
      : super([
          NumberModel(
            name: 1,
            chkButton: false,
          ),
          NumberModel(
            name: 2,
            chkButton: false,
          ),
          NumberModel(
            name: 3,
            chkButton: false,
          ),
          NumberModel(
            name: 4,
            chkButton: false,
          ),
          NumberModel(
            name: 5,
            chkButton: false,
          ),
          NumberModel(
            name: 6,
            chkButton: false,
          ),
          NumberModel(
            name: 7,
            chkButton: false,
          ),
          NumberModel(
            name: 8,
            chkButton: false,
          ),
          NumberModel(
            name: 9,
            chkButton: false,
          ),
          NumberModel(
            name: 10,
            chkButton: false,
          ),
          NumberModel(
            name: 11,
            chkButton: false,
          ),
          NumberModel(
            name: 12,
            chkButton: false,
          ),
          NumberModel(
            name: 13,
            chkButton: false,
          ),
          NumberModel(
            name: 14,
            chkButton: false,
          ),
          NumberModel(
            name: 15,
            chkButton: false,
          ),
        ]);

  void chkBtn({required int name}) {
    state = state
        .map((e) => //state 는 클래스 안의 상태
            e.name == name
                ? NumberModel(
                    name: e.name,
                    chkButton: !e.chkButton,
                  )
                : e)
        .toList();
  }
}

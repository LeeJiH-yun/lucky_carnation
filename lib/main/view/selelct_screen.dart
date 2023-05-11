import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucky_carnation/main/model/number_model.dart';
import 'package:lucky_carnation/main/riverpod/num_notifier_provider.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';

//코드 정리 필요...

class SelectScreen extends ConsumerStatefulWidget {
  static String get routeName => 'SelectScreen';
  const SelectScreen({super.key});

  @override
  ConsumerState<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends ConsumerState<SelectScreen> {
  int selectNum = 1;
  final wordToStyle = '행운의 카네이션';
  final wordStyle = TextStyle(color: Colors.red);
  late Text selectText;
  bool isClick = false; //클릭 여부
  int chkNum = 0;
  AudioPlayer? audioPlayerback;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    audioPlayerback = AudioPlayer();
    await audioPlayerback!.setReleaseMode(ReleaseMode.loop);
    await audioPlayerback!
        .play(DeviceFileSource('assets/mp3/background_music.mp3'));
  }

  @override
  void dispose() {
    audioPlayerback!.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //late int returnData = 0;

    final test = ref.read(numberProvider);
    // final test2 = ref.read(numListProvider);
    // final List<NumberModel> state = ref.watch(numListProvider);

    bool visible = true;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/explain_background.png'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  child: Image.asset('assets/images/꽃다발.png'),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: 50.0),
                      Container(
                        width: 300,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white, width: 2.0),
                            bottom: BorderSide(color: Colors.white, width: 2.0),
                          ),
                        ),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          '어버이주일',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        //행운의 카네이션에만 색상 넣는 방법 더 찾아보기
                        child: Text(
                          '행운의 카네이션을',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '찾아라!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Container(
                        width: 650,
                        height: 500,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  //visibility 사용했더니 공간도 사라져서 ui가 이상해짐
                                  opacity: test == 1
                                      ? 0.0
                                      : 1.0, //1이 들어있다는 건 이미 한번 선택했다는..
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      setState(() {
                                        var test = 1;
                                        isClick = !isClick;
                                        selectNum = test;
                                      });
                                    },
                                    child: Container(
                                      width: 80,
                                      color: isClick
                                          ? Color(0XFFFFA7A7)
                                          : Colors.transparent,
                                      child: Image.asset(
                                        'assets/images/숫자_1.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  //opacity: state.where((e) => e.name == 2) == 2
                                  opacity: test == 2 ? 0.0 : 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 2;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_2.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 3;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_3.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 4;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_4.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 5;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_5.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 6;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_6.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 7;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_7.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 8;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_8.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 9;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_9.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 10;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_10.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 11;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_11.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 12;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_12.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 13;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_13.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 14;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_14.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 1.0,
                                  child: InkWell(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onTap: () {
                                      selectNum = 15;
                                      isClick = !isClick;
                                    },
                                    child: Container(
                                      width: 80,
                                      child: Image.asset(
                                        'assets/images/숫자_15.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 50,
                                  child: ElevatedButton(
                                    onHover: (value) {
                                      playSounds('hover');
                                    },
                                    onPressed: () async {
                                      playSounds('press');
                                      if (!isClick) {
                                        //showToast();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('숫자 선택하세용')));
                                        //선택안했으면 막아야함
                                        return;
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ResultScreen(
                                                selectNum: selectNum),
                                          ),
                                        );
                                      }
                                      // ref.read(numListProvider.notifier).chkBtn(
                                      //     name: selectNum); //선택된 숫자의 값을 바꿔
                                      // if (selectNum == 1) {
                                      ref.read(numberProvider.notifier).state =
                                          selectNum; //버튼 누르면서 값을 바꿔야.. 왜지
                                      // } else {
                                      //   ref.read(twonumProvider.notifier).state =
                                      //       selectNum;
                                      // }
                                      audioPlayerback!.stop();
                                    },
                                    child: Text('결과보기'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectNumber(bool isSelect) {}
  void showToast() {
    Fluttertoast.showToast(
      msg: '숫자를 선택하세요!',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  Widget textWidget(int num) {
    selectText = Text(num.toString());
    return Text(num.toString());
  }

  Future<void> playSounds(String type) async {
    AudioPlayer? audioPlayer = AudioPlayer();

    if (type == 'press') {
      await audioPlayer.play(DeviceFileSource('assets/mp3/mouse_click.mp3'));
    } else {
      await audioPlayer.play(DeviceFileSource('assets/mp3/버튼에올렸을때효과음.mp3'));
    }
  }
}

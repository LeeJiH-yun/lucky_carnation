import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucky_carnation/main/model/number_model.dart';
import 'package:lucky_carnation/main/riverpod/num_notifier_provider.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';
import 'package:window_manager/window_manager.dart';

//코드 정리 필요...

class SelectScreen extends ConsumerStatefulWidget {
  static String get routeName => 'SelectScreen';
  const SelectScreen({super.key});

  @override
  ConsumerState<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends ConsumerState<SelectScreen> {
  int selectNum = 0;
  final wordToStyle = '행운의 카네이션';
  final wordStyle = TextStyle(color: Colors.red);
  late Text selectText;
  bool isClick = false; //클릭 여부
  int chkNum = 0;
  AudioPlayer? audioPlayerback;
  Color? selectColor = Color(0XFFFFC7D6); //기본색상

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
    FocusNode? mainFocusNode = FocusNode();

    //저세상 수정 코드
    final test = ref.read(numberProvider);
    final test2 = ref.read(twonumProvider);
    final test3 = ref.read(threenumProvider);
    final test4 = ref.read(fournumProvider);
    final test5 = ref.read(fivenumProvider);
    final test6 = ref.read(sixnumProvider);
    final test7 = ref.read(sevenProvider);
    final test8 = ref.read(eightProvider);
    final test9 = ref.read(nineProvider);
    final test10 = ref.read(tenProvider);
    final test11 = ref.read(elevenProvider);
    final test12 = ref.read(twelveProvider);
    final test13 = ref.read(thirteenProvider);
    final test14 = ref.read(fourteenProvider);
    final test15 = ref.read(fifteenProvider);

    bool visible = true;

    return RawKeyboardListener(
      autofocus: true,
      focusNode: mainFocusNode,
      onKey: (key) async {
        if (key.isKeyPressed(LogicalKeyboardKey.keyF)) {
          await windowManager.setFullScreen(false);
        } else if (key.isKeyPressed(LogicalKeyboardKey.keyQ)) {
          await setSingleScreen();
        }
      },
      child: Container(
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
                              bottom:
                                  BorderSide(color: Colors.white, width: 2.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                    //visibility 사용했더니 공간도 사라져서 ui가 이상해짐
                                    opacity: test == 1
                                        ? 0.0
                                        : 1.0, //1이 들어있다는 건 이미 한번 선택했다는..
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      //1번 선택했을 때 -> selectNum이 0인 경우 selectNum = 1
                                      //다시 1번 선택해서 선택해제했을 때 -> selectNum = 0
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 1)
                                                  ? 1
                                                  : 0;

                                          // if (selectNum == 0) {
                                          //   //처음 선택시
                                          //   selectNum = 1;
                                          // } else if (selectNum != 1) {
                                          //   //최초 선택이 아니고 다른 숫자 선택 후 선택했을 때
                                          //   selectNum = 1;
                                          // }
                                          // else if (selectNum == 1) { //선택 취소일 경우 이미 값이 들어있는데 선택한거니까
                                          //   selectNum = 0;
                                          // }
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 1
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_1.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test2 == 2 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 2)
                                                  ? 2
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 2
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_2.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test3 == 3 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 3)
                                                  ? 3
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 3
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_3.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test4 == 4 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 4)
                                                  ? 4
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 4
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_4.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test5 == 5 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 5)
                                                  ? 5
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 5
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                    opacity: test6 == 6 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 6)
                                                  ? 6
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 6
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_6.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test7 == 7 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 7)
                                                  ? 7
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 7
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_7.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test8 == 8 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 8)
                                                  ? 8
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 8
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_8.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test9 == 9 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum =
                                              (selectNum == 0 || selectNum != 9)
                                                  ? 9
                                                  : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 9
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_9.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test10 == 10 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 10)
                                              ? 10
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 10
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Opacity(
                                    opacity: test11 == 11 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 11)
                                              ? 11
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 11
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_11.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test12 == 12 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 12)
                                              ? 12
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 12
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_12.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test13 == 13 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 13)
                                              ? 13
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 13
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_13.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test14 == 14 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 14)
                                              ? 14
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 14
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
                                        child: Image.asset(
                                          'assets/images/숫자_14.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: test15 == 15 ? 0.0 : 1.0,
                                    child: ElevatedButton(
                                      onHover: (value) {
                                        playSounds('hover');
                                      },
                                      onPressed: () {
                                        setState(() {
                                          selectNum = (selectNum == 0 ||
                                                  selectNum != 15)
                                              ? 15
                                              : 0;
                                          playSounds('press');
                                          selectColor =
                                              selectColor == Colors.pink
                                                  ? Color(0XFFFFC7D6)
                                                  : Colors.pink;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: selectNum == 15
                                            ? selectColor
                                            : Color(0XFFFFC7D6),
                                        shape: CircleBorder(),
                                      ),
                                      child: Container(
                                        width: 70,
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
                                        if (selectNum == 0) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('숫자 선택하세용'),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                          //선택안했으면 막아야함
                                          return;
                                        } else {
                                          print('selectNum: $selectNum');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultScreen(
                                                      selectNum: selectNum),
                                            ),
                                          );
                                        }

                                        //ㅋㅋㅋ코드 수정 매우 필요
                                        switch (selectNum) {
                                          case 1:
                                            ref
                                                .read(numberProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 2:
                                            ref
                                                .read(twonumProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 3:
                                            ref
                                                .read(threenumProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 4:
                                            ref
                                                .read(fournumProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 5:
                                            ref
                                                .read(fivenumProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 6:
                                            ref
                                                .read(sixnumProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 7:
                                            ref
                                                .read(sevenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 8:
                                            ref
                                                .read(eightProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 9:
                                            ref
                                                .read(nineProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 10:
                                            ref
                                                .read(tenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 11:
                                            ref
                                                .read(elevenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 12:
                                            ref
                                                .read(twelveProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 13:
                                            ref
                                                .read(thirteenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 14:
                                            ref
                                                .read(fourteenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                          case 15:
                                            ref
                                                .read(fifteenProvider.notifier)
                                                .state = selectNum;
                                            break;
                                        }

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
      ),
    );
  }

  Widget textWidget(int num) {
    //결과 텍스트 위젯
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

  Future<void> setSingleScreen() async {
    //전체화면
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1920, 1080),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: 'luckyCarnation',
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.setFullScreen(true);
    });
  }
}

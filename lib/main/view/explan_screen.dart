import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_event/keyboard_event.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';
import 'package:window_manager/window_manager.dart';

class ExplanScreen extends StatefulWidget {
  static String get routeName => 'ExplanScreen';
  const ExplanScreen({super.key});

  @override
  State<ExplanScreen> createState() => _ExplanScreenState();
}

class _ExplanScreenState extends State<ExplanScreen> {
  bool selected = true; //클릭 이벤트시 사용
  AudioPlayer? audioPlayerback;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    audioPlayerback = AudioPlayer();
    await audioPlayerback!.setReleaseMode(ReleaseMode.loop);
    await audioPlayerback!.play(AssetSource('mp3/background_music.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    FocusNode? mainFocusNode = FocusNode();

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
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 1080,
                  height: 700,
                  child: Image.asset(
                    'assets/images/explain_text_back.png',
                  ),
                ),
                Positioned(
                  bottom: 450,
                  right: 820,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/explain_carnation_one.png',
                    ),
                  ),
                ),
                Positioned(
                  bottom: 470,
                  right: 770,
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/explain_carnation_one.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    child: Text(
                      'TO. 사랑하는 우리가교회 가족 여러분 \n 과연 1등 카네이션은 몇 번에 숨어있을까요? \n 숫자를 선택해주세요!🤗',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned(
                  top: 370,
                  left: 440,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.asset(
                          'assets/images/start_button.png',
                        ),
                      ),
                      Positioned(
                        top: 52,
                        width: 200,
                        height: 100,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onHover: (value) {
                              if (value) {
                                playSounds('hover'); //효과음 넣기
                              }
                            },
                            onTap: () {
                              playSounds('press'); //효과음 넣기
                              setState(() {
                                selected = !selected;
                              });
                              //시작 화면으로 이동하기
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectScreen(),
                                ),
                              );
                              audioPlayerback!
                                  .stop(); //화면이동시 음악 멈춰준다. 안그러면 안 멈추..
                              // context.pushNamed(
                              //     SelectScreen.routeName);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 380,
                  left: 830,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/explain_carnation_two.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 780,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      'assets/images/explain_carnation_two.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 500,
                  left: 880,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/카네이션_5_좌우반전.png',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> playSounds(String type) async {
    AudioPlayer? audioPlayer = AudioPlayer();

    if (type == 'press') {
      //버튼 클릭시
      await audioPlayer.play(AssetSource('mp3/start_button.mp3'));
    } else {
      //마우스를 올렸을 경우
      await audioPlayer.play(AssetSource('mp3/button_hover.mp3'));
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

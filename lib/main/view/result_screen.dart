import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_carnation/main/view/explan_screen.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';
import 'package:window_manager/window_manager.dart';

class ResultScreen extends ConsumerStatefulWidget {
  final int selectNum; //이전화면에서 선택한 값으로 당첨여부확인
  static String get routeName => 'ResultScreen';
  const ResultScreen({super.key, required this.selectNum});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isVisible = false;

  AudioPlayer? audioPlayer = AudioPlayer();
  AudioPlayer? audioPlayeranimation = AudioPlayer();
  String? text; //멘트

  @override
  void initState() {
    //넘어온 데이터로 저장해준다.
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    playSounds('animation');
    _controller.forward(); //이게 있어야 fade제대로 댐

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        //애니메이션이 다 올라오고 난 후 당첨을 표시하기 위해 딜레이
        isVisible = true;
        textResult(); //멘트 결과
        playSounds('result');
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
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
      child: Scaffold(
        backgroundColor: Color(0XFFFFC7D6),
        body: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            SlideTransition(
              position: _animation.drive(
                Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  width: 500,
                  height: 1180,
                  fit: BoxFit.fill,
                  'assets/images/편지지.png',
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width == 1920 ? 200 : 150,
              child: Visibility(
                visible: isVisible,
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        text.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      imageResult(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width == 1920 ? 400 : 280,
              left: 200,
              child: Container(
                child: Image.asset(
                  'assets/images/카네이션_3.png',
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width == 1920 ? 450 : 320,
              left: 150,
              child: Container(
                child: Image.asset(
                  'assets/images/카네이션_3.png',
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width == 1920 ? 450 : 320,
              right: 250,
              child: Container(
                child: Image.asset(
                  'assets/images/카네이션_4.png',
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.width == 1920 ? 400 : 280,
              right: 200,
              child: Container(
                child: Image.asset(
                  'assets/images/카네이션_4.png',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                width: 500,
                height: 1080,
                fit: BoxFit.fill,
                'assets/images/편지지봉투.png',
              ),
            ),
            Positioned(
              //뒤로가기 버튼
              top: MediaQuery.of(context).size.width == 1920 ? 670 : 550,
              right: 100,
              child: InkWell(
                onHover: (value) {
                  playSounds('hover');
                },
                onTap: () {
                  playSounds('back');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => SelectScreen()),
                  );
                },
                child: Visibility(
                  visible: isVisible,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/backbutton.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 890,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ExplanScreen()),
                  );
                  audioPlayer!.stop(); //왜케 화면 이동시 안 멈춰가지고!!! 잉..
                },
                child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    'assets/images/test_imag.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void textResult() {
    //결과텍스트
    if (widget.selectNum == 1 ||
        widget.selectNum == 8 ||
        widget.selectNum == 14) {
      text = '3등입니당';
    } else if (widget.selectNum == 2 ||
        widget.selectNum == 5 ||
        widget.selectNum == 13 ||
        widget.selectNum == 10) {
      text = '1등입니당';
    } else {
      text = '2등입니당';
    }
  }

  Widget imageResult() {
    //결과이미지 위젯
    final ranking = (widget.selectNum == 1 ||
            widget.selectNum == 8 ||
            widget.selectNum == 14)
        ? 3
        : (widget.selectNum == 2 ||
                widget.selectNum == 5 ||
                widget.selectNum == 13 ||
                widget.selectNum == 10)
            ? 1
            : 2;

    return (ranking == 3)
        ? Row(
            children: [
              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/상품종이접기.png'),
              ),
              Container(
                width: 300,
                height: 300,
                child: Image.asset('assets/images/상품성경책커버.png'),
              ),
            ],
          )
        : Container(
            width: 300,
            height: 300,
            child: Image.asset(ranking == 1
                ? 'assets/images/상품생화.png'
                : 'assets/images/상품브로치.png'),
          );
  }

  Future<void> playSounds(String type) async {
    AudioPlayer? audiobackPlayer = AudioPlayer(); //뒤로가기버튼

    if (type == 'result') {
      //결과효과음
      if (widget.selectNum == 1 || //3등
          widget.selectNum == 8 ||
          widget.selectNum == 14) {
        await audioPlayer!.play(AssetSource('mp3/result_three.mp3'));
      } else if (widget.selectNum == 2 || //1등
          widget.selectNum == 5 ||
          widget.selectNum == 13 ||
          widget.selectNum == 10) {
        await audioPlayer!.play(AssetSource('mp3/result_one.mp3'));
      } else {
        //2등
        await audioPlayer!.play(AssetSource('mp3/result_two.mp3'));
      }
    } else if (type == 'back') {
      //뒤로가기 버튼
      await audiobackPlayer.play(AssetSource('mp3/replay_button.mp3'));
    } else if (type == 'hover') {
      //버튼에올렸을때 효과음
      await audioPlayer!.play(AssetSource('mp3/button_hover.mp3'));
    } else {
      //애니메이션 올라갈때 효과음
      await audioPlayer!.play(AssetSource('mp3/animation.mp3'));
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

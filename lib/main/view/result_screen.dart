import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lucky_carnation/main/view/explan_screen.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';

class ResultScreen extends StatefulWidget {
  //final int selectNum; //이전화면에서 선택한 값으로 당첨여부확인
  static String get routeName => 'ResultScreen';
  //const ResultScreen({required this.selectNum, super.key});
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? timer;
  bool isVisible = false;
  AudioPlayer? audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); //이게 있어야 fade제대로 댐

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      playSounds();
      audioPlayer!.stop();
      setState(() {
        //애니메이션이 다 올라오고 난 후 당첨을 표시하기 위해 타이머 사용
        isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 200,
            child: Visibility(
              visible: isVisible,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      child: Image.asset(
                        'assets/images/상품브로치.png',
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      '1등입니당',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 200,
            child: Container(
              child: Image.asset(
                'assets/images/카네이션_3.png',
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 150,
            child: Container(
              child: Image.asset(
                'assets/images/카네이션_3.png',
              ),
            ),
          ),
          Positioned(
            top: 450,
            right: 250,
            child: Container(
              child: Image.asset(
                'assets/images/카네이션_4.png',
              ),
            ),
          ),
          Positioned(
            top: 400,
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
            top: 600,
            child: InkWell(
              onTap: () {
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
            top: 980,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ExplanScreen()),
                );
              },
              child: Container(
                width: 100,
                height: 100,
                child: Text('설명 화면으로!'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> playSounds() async {
    bool istest = false;

    await audioPlayer!.play(DeviceFileSource('assets/mp3/result.mp3'));
    istest = true;

    if (istest) {
      //효과음이 한 번만 나오게끔 수정..
      //await audioPlayer.stop();
    }
  }
}

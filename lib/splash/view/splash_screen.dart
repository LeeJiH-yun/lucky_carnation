import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_carnation/main/view/explan_screen.dart';
import 'dart:developer' as developer;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int index = 0;
  int nextSum = 0;
  Timer? timer;
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    _init();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      for (int i = index; i <= 4; i++) {
        print('index $index');
      }
      index++;
      nextSum++;
      developer.log('nextSum: $nextSum');
      if (index >= 4) {
        index = 0;
      }
      if (nextSum == 7) {
        //설명화면으로 전환
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExplanScreen()));
        audioPlayer!.stop(); //아오 음악이 안 멈춰서 화면 이동시 멈춰준다.
        timer.cancel();
      }
      setState(() {});
    });

    super.initState();
  }

  Future<void> _init() async {
    audioPlayer = AudioPlayer();
    await audioPlayer!.setReleaseMode(ReleaseMode.loop);
    await audioPlayer!
        .play(DeviceFileSource('assets/mp3/background_music.mp3'));
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/green_background.jpg'), // 배경 이미지
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1000,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Visibility(
                      visible: index == 0 ? true : false,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0XFFF7DDEA),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0XFFF7DDEA)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 1 ? true : false,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0XFFF2A6CA),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0XFFF2A6CA)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 2 ? true : false,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0XFFF36D86),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0XFFF36D86)),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: index == 3 ? true : false,
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          'assets/images/carnation.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 1000,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: Image.asset(
                        'assets/images/cute.gif',
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

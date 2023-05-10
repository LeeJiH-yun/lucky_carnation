import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';

class ExplanScreen extends StatefulWidget {
  static String get routeName => 'ExplanScreen';
  const ExplanScreen({super.key});

  @override
  State<ExplanScreen> createState() => _ExplanScreenState();
}

class _ExplanScreenState extends State<ExplanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Container(
          width: 1000,
          height: 500,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '  프로그램 소개\n텍스트 배치 공간',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              SizedBox(
                height: 100,
                width: 300,
                child: ElevatedButton(
                  onHover: (value) {
                    if (value) {
                      playSounds('hover'); //효과음 넣기
                    }
                  },
                  onPressed: () {
                    playSounds('press'); //효과음 넣기
                    //시작 화면으로 이동하기
                    context.pushNamed(SelectScreen.routeName);
                  },
                  child: Text(
                    'START',
                    style: TextStyle(fontSize: 23.0),
                  ),
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> playSounds(String type) async {
    AudioPlayer? audioPlayer = AudioPlayer();

    if (type == 'press') {
      //버튼 클릭시
      await audioPlayer.play(DeviceFileSource('assets/mp3/mouse_click.mp3'));
    } else {
      //마우스를 올렸을 경우
      await audioPlayer.play(DeviceFileSource('assets/mp3/button_focus.mp3'));
    }
  }
}

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
    return Container(
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
                bottom: 410,
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
              Container(
                child: Text(
                  '어버이주일을 맞이하여 \n 색다르게 준비해보았습니다.\n 행운의 카네이션은 누구에게로?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 370,
                left: 440,
                child: InkWell(
                  onHover: (value) {
                    if (value) {
                      playSounds('hover'); //효과음 넣기
                    }
                  },
                  onTap: () {
                    playSounds('press'); //효과음 넣기
                    //시작 화면으로 이동하기
                    context.pushNamed(SelectScreen.routeName);
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      'assets/images/start_button.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 380,
                left: 820,
                child: Container(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    'assets/images/explain_carnation_two.png',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // child: Container(
      //   height: 100,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       fit: BoxFit.contain,
      //       image: AssetImage('assets/images/explain_text_back.png'), // 편지지 이미지
      //     ),
      //   ),
      //   child: Scaffold(
      //     resizeToAvoidBottomInset: false,
      //     backgroundColor: Colors.transparent,
      //     body: Center(
      //       child: Column(
      //         children: [
      //           Container(
      //             height: 5000,
      //             color: Colors.blue,
      //             child: Text('프로그램 소개 텍스트 배치'),
      //           ),
      //           Container(
      //             child: Text('공간입니다.'),
      //           ),
      //           SizedBox(
      //             height: 100,
      //             width: 300,
      //             child: ElevatedButton(
      //               onHover: (value) {
      //                 if (value) {
      //                   playSounds('hover'); //효과음 넣기
      //                 }
      //               },
      //               onPressed: () {
      //                 playSounds('press'); //효과음 넣기
      //                 //시작 화면으로 이동하기
      //                 context.pushNamed(SelectScreen.routeName);
      //               },
      //               child: Text(
      //                 'START',
      //                 style: TextStyle(fontSize: 23.0),
      //               ),
      //               style:
      //                   ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.lightBlue,
  //     body: Center(
  //       child: Container(
  //         width: 1000,
  //         height: 500,
  //         color: Colors.white,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Text(
  //               '  프로그램 소개\n텍스트 배치 공간',
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
  //             ),
  //             SizedBox(
  //               height: 100,
  //               width: 300,
  //               child: ElevatedButton(
  //                 onHover: (value) {
  //                   if (value) {
  //                     playSounds('hover'); //효과음 넣기
  //                   }
  //                 },
  //                 onPressed: () {
  //                   playSounds('press'); //효과음 넣기
  //                   //시작 화면으로 이동하기
  //                   context.pushNamed(SelectScreen.routeName);
  //                 },
  //                 child: Text(
  //                   'START',
  //                   style: TextStyle(fontSize: 23.0),
  //                 ),
  //                 style: ElevatedButton.styleFrom(padding: EdgeInsets.all(10)),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';

class ExplanScreen extends StatelessWidget {
  static String get routeName => 'ExplanScreen';
  const ExplanScreen({super.key});

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
                  onPressed: () {
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
}

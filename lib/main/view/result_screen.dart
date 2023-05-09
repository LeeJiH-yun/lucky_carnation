import 'dart:async';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  static String get routeName => 'ResultScreen';
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

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); //이게 있어야 fade제대로 댐

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
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
        body: SlideTransition(
      //위에서 아래로
      position: _animation.drive(
        Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue,
        child: Visibility(
          visible: isVisible,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/images/test_imag.png'),
              ),
              Text(
                '당당첨',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(onPressed: () {}, child: Text('다시 선택하기!'))
            ],
          ),
        ),
      ),
    ));
  }
}

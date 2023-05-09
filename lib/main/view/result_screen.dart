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

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward(); //이게 있어야 fade제대로 댐
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlideTransition(
      //위에서 아래로
      position: _animation
          .drive(Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero)),
      child: Container(
        color: Colors.blue,
        child: Text(
          '당당첨',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
    ));
  }
}

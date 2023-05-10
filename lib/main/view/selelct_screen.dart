import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';

//코드 정리 필요...

class SelectScreen extends StatefulWidget {
  static String get routeName => 'SelectScreen';
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int selectNum = 0;
  final wordToStyle = '행운의 카네이션';
  final wordStyle = TextStyle(color: Colors.red);
  late Text selectText;

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
        body: Row(
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
                          bottom: BorderSide(color: Colors.white, width: 2.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_1.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_2.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_3.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_4.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_5.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_6.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_7.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_8.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_9.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_10.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_11.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_12.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_13.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {},
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_14.png',
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (value) {},
                                onTap: () {
                                  selectNum = 15;
                                },
                                child: Container(
                                  width: 80,
                                  child: Image.asset(
                                    'assets/images/숫자_15.png',
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
                                  onPressed: () {
                                    //context.pushNamed(ResultScreen.routeName); context가 안찍힘..;
                                    playSounds();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (_) => ResultScreen()),
                                    );
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
    );
  }

  void selectNumber(bool isSelect) {}

  Widget textWidget(int num) {
    selectText = Text(num.toString());
    return Text(num.toString());
  }

  Future<void> playSounds() async {
    AudioPlayer? audioPlayer = AudioPlayer();

    await audioPlayer.play(DeviceFileSource('assets/mp3/mouse_click.mp3'));
  }
}

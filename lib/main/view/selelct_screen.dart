import 'package:flutter/material.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';

class SelectScreen extends StatelessWidget {
  static String get routeName => 'SelectScreen';
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectNum = 0;
    final wordToStyle = '행운의 카네이션';
    final wordStyle = TextStyle(color: Colors.red);

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: MediaQuery.of(context)
                  .size
                  .height, //이미지 넣으니까 높이가 이미지에 맞춰져서 전체 화면 높이에 맞췄다.
              color: Colors.orange,
              child: Container(
                child: Image.asset('assets/images/gift-box_test.png'),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 50.0),
                    Container(
                      width: 300,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.white),
                          bottom: BorderSide(color: Colors.white),
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
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag:
                                      'btn1', //floatingActionButton은 이거 지정해줘야 여러개 쓸 수 잇음
                                  onPressed: () {
                                    print('');
                                    selectNumber(num);
                                  },
                                  child: Text('1'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn2',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('2'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn3',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('3'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn4',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('4'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn5',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('5'),
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
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn6',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('6'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn7',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('7'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn8',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('8'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn9',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('9'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn0',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('0'),
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
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn11',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('11'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn12',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('12'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn13',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('13'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn14',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('14'),
                                ),
                              ),
                              Container(
                                width: 80,
                                child: FloatingActionButton(
                                  heroTag: 'btn15',
                                  onPressed: () {
                                    selectNumber(num);
                                  },
                                  child: Text('15'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  '선택한 숫자 : ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  '$selectNum',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //context.pushNamed(ResultScreen.routeName); context가 안찍힘..;

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
          ),
        ],
      ),
    );
  }

  void selectNumber(num) {
    // if () {
    //   showAboutDialog(context: Text('하나만 선택이 가능해요'));
    //   return;
    // }
  }
}

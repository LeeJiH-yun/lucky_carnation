import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_carnation/main/view/explan_screen.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';
import 'package:lucky_carnation/splash/view/splash_screen.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:developer' as developer;

import 'package:window_manager/window_manager.dart';

/*
  1등 생화 약 10000원 * 4명 
  => 2, 5, 13, 10
  2등 브로치 약 5000원 * 8명
  => 3, 4, 6, 7, 9, 11, 12, 15
  3등 종이접기 + 성경책 커버 3명 (15000 * 3) 
  => 1, 8, 14

  앱 exe파일로 꺼낼때
  - 하단 터미널에 flutter build windows 하면 /build/windows/runner/Release 경로에 파일이 생긴다.
*/
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer? audioPlayer;

  @override
  void initState() {
    _init();
    setSingleScreen();

    super.initState();
  }

  @override
  void dispose() {
    developer.log('Audio App dispose');
    //audioPlayer!.setReleaseMode(ReleaseMode.stop);
    super.dispose();
  }

  Future<void> _init() async {
    await DesktopWindow.setFullScreen(
        true); //맨처음에 꽉 찬 화면 됐다가 windows안의 main.cpp로 인해 창이 변하는 거 같다.
    audioPlayer = AudioPlayer();
    // final test = ref.watch();
    // if ()
    await audioPlayer!.setReleaseMode(ReleaseMode.loop);
    // await audioPlayer!
    //     .play(DeviceFileSource('assets/mp3/background_music.mp3'));
  }

  // GoRouter get _router => GoRouter(
  //       initialLocation: '/',
  //       routes: [
  //         GoRoute(
  //           path: '/', //로딩화면
  //           builder: (_, state) => SelectScreen(),
  //           //builder: (_, state) => ResultScreen(),
  //           routes: [
  //             GoRoute(
  //               path: 'explan',
  //               name: ExplanScreen.routeName,
  //               builder: (_, state) => ExplanScreen(),
  //             ),
  //             GoRoute(
  //               path: 'select',
  //               name: SelectScreen.routeName,
  //               builder: (_, state) => SelectScreen(),
  //               routes: [
  //                 GoRoute(
  //                   path: 'result',
  //                   name: ResultScreen.routeName,
  //                   builder: (_, state) => ResultScreen(selectNum: ,),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         )
  //       ],
  //     );

  // @override gorouter사용하려다가 일정 맞추려면 걍 쉽게 간다..
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     debugShowCheckedModeBanner: false,
  //     routeInformationParser: _router.routeInformationParser,
  //     routerDelegate: _router.routerDelegate,
  //     routeInformationProvider: _router.routeInformationProvider,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    FocusNode? mainFocusNode = FocusNode();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RawKeyboardListener(
        autofocus: true,
        focusNode: mainFocusNode,
        onKey: (key) async {
          if (key.isKeyPressed(LogicalKeyboardKey.keyF)) {
            //전체화면 빠져나오기 (한글로 바꿔야 먹힌다ㅋㅋ)
            await windowManager.setFullScreen(false);
          } else if (key.isKeyPressed(LogicalKeyboardKey.keyQ)) {
            //다시 전체화면
            await setSingleScreen();
          }
        },
        child: SplashScreen(),
      ),
    );
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

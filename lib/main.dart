import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:go_router/go_router.dart';
import 'package:lucky_carnation/main/view/explan_screen.dart';
import 'package:lucky_carnation/main/view/result_screen.dart';
import 'package:lucky_carnation/main/view/selelct_screen.dart';
import 'package:lucky_carnation/splash/view/splash_screen.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
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

    super.initState();
  }

  @override
  void dispose() {
    developer.log('Audio App dispose');
    audioPlayer!.setReleaseMode(ReleaseMode.stop);
    super.dispose();
  }

  Future<void> _init() async {
    audioPlayer = AudioPlayer();
    await audioPlayer!.setReleaseMode(ReleaseMode.loop);
    await audioPlayer!
        .play(DeviceFileSource('assets/mp3/background_music.mp3'));
  }

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/', //로딩화면
            builder: (_, state) => ResultScreen(),
            routes: [
              GoRoute(
                path: 'explan',
                name: ExplanScreen.routeName,
                builder: (_, state) => ExplanScreen(),
              ),
              GoRoute(
                path: 'select',
                name: SelectScreen.routeName,
                builder: (_, state) => SelectScreen(),
                routes: [
                  GoRoute(
                    path: 'result',
                    name: ResultScreen.routeName,
                    builder: (_, state) => ResultScreen(),
                  ),
                ],
              ),
            ],
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

// class Home extends StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   AudioPlayer? audioPlayer;

//   @override
//   void initState() {
//     _init();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     developer.log('Audio App dispose');
//     audioPlayer!.setReleaseMode(ReleaseMode.stop);
//     super.dispose();
//   }

//   Future<void> _init() async {
//     audioPlayer = AudioPlayer();
//     await audioPlayer!.setReleaseMode(ReleaseMode.loop);
//     await audioPlayer!
//         .play(DeviceFileSource('assets/mp3/background_music.mp3'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SplashScreen(),
//       //home: ExplanScreen(),
//     );
//   }
// }

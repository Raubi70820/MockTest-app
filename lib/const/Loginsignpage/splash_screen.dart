
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:test_dart/const/Loginsignpage/loginscreen.dart';
import 'package:test_dart/const/const.dart';
class SplashScreenWithSound extends StatefulWidget {
  const SplashScreenWithSound({super.key});

  @override
  _SplashScreenWithSoundState createState() => _SplashScreenWithSoundState();
}

class _SplashScreenWithSoundState extends State<SplashScreenWithSound> {
 

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.blue1,
          AppColors.blue1
        ]
          
      ),
      childWidget: AnimatedContainer(
        duration: const Duration(milliseconds: 4000),
        height: double.infinity,
        width: double.infinity,
        child: Image.asset(
          "assets/quiz2.png",
          fit: BoxFit.cover,
        ),
      ),
      duration: const Duration(milliseconds: 4000),
      animationDuration: const Duration(milliseconds: 4000),
      onAnimationEnd: () {
        debugPrint("On Scale End");
        // _audioPlayer.stop(); // Stop sound after the splash screen
      },
      nextScreen:LoginScreen(),
    );
  }
}



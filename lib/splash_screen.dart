import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/weather_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 late AnimationController _animationController;

 void animate(){

 }
  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherPage()));
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Center(


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/weather2.json'),
          ],
        ),
      )),
    );
  }
}

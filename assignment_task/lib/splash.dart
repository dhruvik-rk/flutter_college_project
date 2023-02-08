import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 1000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/images/splash_logo.png'),
              Text('MyB',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
            ],
          ),
        ),
      ),
    );
  }
}
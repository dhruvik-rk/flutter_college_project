import 'package:flutter/material.dart';

class LoctionPage extends StatefulWidget {
  @override
  State<LoctionPage> createState() => _LoctionPageState();
}

class _LoctionPageState extends State<LoctionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Location Page'),
        ),
      ),
    );
  }
}
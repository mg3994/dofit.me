// TODO: Themer 기능의 화면(Screen)을 구현하세요.
import 'package:flutter/material.dart';

class ThemerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Themer Screen'),
      ),
      body: Center(
        child: Text('This is the Themer screen'),
      ),
    );
  }
}
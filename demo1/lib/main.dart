import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gitTest',
      home: Scaffold(
        appBar: AppBar(title: Text('git'),),
        body: Center(
          child: Text('gitTest'),
        ),
      ),
    );
  }
}
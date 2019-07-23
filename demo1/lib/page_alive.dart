import 'package:flutter/material.dart';

class Apage extends StatefulWidget {
  @override
  _ApageState createState() => _ApageState();
}

class _ApageState extends State<Apage> with AutomaticKeepAliveClientMixin{
  int _count = 0;

  @override
  //wantKeepAlive 是 AutomaticKeepAliveClientMixin 中的固定搭配
  bool get wantKeepAlive => true;

  void _increase(){
   setState(() {
     _count++;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click and it\'ll add one.'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display1,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increase,
      ),
    );
  }
}
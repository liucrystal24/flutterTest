import 'package:flutter/material.dart';
import 'page_alive.dart';

void main()=>runApp(MaterialApp(
  title: 'pageAlive',
  home: PageAlive(),
));

class PageAlive extends StatefulWidget {
  @override
  _PageAliveState createState() => _PageAliveState();
}

class _PageAliveState extends State<PageAlive> with SingleTickerProviderStateMixin{
  // 申明类型
  TabController _tabcontroller;
  @override
  void initState(){
    super.initState();
    //定义参数
    _tabcontroller  = TabController(length: 3,vsync: this);
  }
  @override
  void dispose(){
    _tabcontroller.dispose();  
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('windows companym'),
        bottom: TabBar(
          controller: _tabcontroller,
          tabs: <Widget>[
            Tab(icon:Icon(Icons.directions_bus)),
            Tab(icon:Icon(Icons.directions_car)),
            Tab(icon:Icon(Icons.directions_boat))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: <Widget>[
          Apage(),
          Apage(),
          Apage(),
        ],
      ) 
    );
  }
}

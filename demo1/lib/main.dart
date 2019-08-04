import 'package:flutter/material.dart';
import 'Cpage.dart';
import 'Csearch.dart';
import 'Cwrap.dart';
import 'CexpansionTile.dart';
import 'CexpansionPanelList.dart';

void main()=>runApp(MaterialApp(
  title: 'pageAlive',
  theme: ThemeData.light(),
  home: TestHome(),
));

class TestHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter demo')),
      body: ListView(
        children: <Widget>[
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('1. Keep Page alive'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new PageAlive() //跳转到第二屏
              ));
            },
          ),
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('2. SearchBar'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new SearchBar() //跳转到第二屏
              ));
            },
          ),
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('3. Wrap'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new WrapPic() //跳转到第二屏
              ));
            },
          ),
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('4. ExpansionTile'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new ExpansionTiledemo() //跳转到第二屏
              ));
            },
          ),
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('5. ExpansionPanellist'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new ExpansionPanelListdemo() //跳转到第二屏
              ));
            },
          ),
        ],
      )
    );
  }
}

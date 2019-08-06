import 'package:flutter/material.dart';
import 'splashScreen.dart';
import 'Cpage.dart';
import 'Csearch.dart';
import 'Cwrap.dart';
import 'CexpansionTile.dart';
import 'CexpansionPanelList.dart';
import 'CpathClip.dart';

//字体引入
class ChrisIcons {
  ChrisIcons._();

  static const String FONT_FAMILY='Chris';

  static const IconData heart = const IconData(0xe8c7 ,fontFamily: FONT_FAMILY);
  static const IconData email = const IconData(0xe8c8, fontFamily: FONT_FAMILY);
  static const IconData home = const IconData(0xe8c9, fontFamily: FONT_FAMILY);
  static const IconData man = const IconData(0xe8ca,fontFamily: FONT_FAMILY);
  static const IconData diamond = const IconData(0xe8cb, fontFamily: FONT_FAMILY);
  static const IconData cake= const IconData(0xe8ce, fontFamily: FONT_FAMILY);
  static const IconData love = const IconData(0xe8cf, fontFamily: FONT_FAMILY);
}

void main()=>runApp(MaterialApp(
  title: 'pageAlive',
  theme: ThemeData.light(),
  //splash 动画
  home: Splashscreen(),
  // home: TestHome(),
  debugShowCheckedModeBanner: false,
));

class TestHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter demo')),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: new Icon(ChrisIcons.love),
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
          ListTile(
            // leading: new Icon(Icons.perm_camera_mic),
            title: new Text('6. PathClip(Bezier)'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> new PathClipDemo() //跳转到第二屏
              ));
            },
          ),
        ],
      )
    );
  }
}

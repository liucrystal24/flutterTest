import 'package:flutter/material.dart';

class WrapPic extends StatefulWidget {
  @override
  _WrapPicState createState() => _WrapPicState();
}

class _WrapPicState extends State<WrapPic> {
  List<Widget> list = List();

  @override
  void initState() {
    super.initState();
    list.add(addbutton());
  }

  @override
  Widget build(BuildContext context) {
    //获取屏幕的长宽
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Warp')),
      body: Center(
        child:Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height/2,
            color: Colors.grey,
            child: Wrap(
              spacing: 26.0,
              children: list,
            ),
          ),
        )
      )
    );
  }
  Widget addbutton(){
    //手势操作
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: Center(
            child: Icon(Icons.add,color: Colors.red),
          ),
        ),
      ),
      onTap: (){
        //statefulWidget中，状态改变时（实现list绑定），函数应放在setState中
        setState(() {
          if(list.length<9){
            list.insert(list.length-1, addPic());
          }
        });
      },
    );
  }

  Widget addPic(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.yellow,
        child: Center(
          child: Text('Pictrue'),
        ),
      ),
    );
  }
}
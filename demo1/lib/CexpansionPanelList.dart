import 'package:flutter/material.dart';

class ExpansionPanelListdemo extends StatefulWidget {
  @override
  _ExpansionPanelListdemoState createState() => _ExpansionPanelListdemoState();
}

class _ExpansionPanelListdemoState extends State<ExpansionPanelListdemo> {
  List<int> mlist;
  List<ExpansionBean> expansionlist;

  //内部的构造方法，刚调用类，就执行， 与initstate区别？实测 initState 可以运行
  _ExpansionPanelListdemoState(){
    mlist = new List();
    expansionlist = new List();
    for(int i= 0;i<10;i++){
      mlist.add(i);
      //类型与类申明一致
      expansionlist.add(ExpansionBean(i, false));
    }
  }
  // @override
  // void initState(){
  //   mlist = new List();
  //   expansionlist = new List();
  //   for(int i= 0;i<10;i++){
  //     mlist.add(i);
  //     //类型与类申明一致
  //     expansionlist.add(ExpansionBean(i, false));
  //   }
  //   super.initState();
  // }

  //控制开关的开闭函数
  _currentState(index,bol){
    setState(() {
      //可以直接下标去反
      //expansionlist[index].isOpen = !bol;
      expansionlist.forEach((item){
        if (item.index == index){
          item.isOpen = !bol;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionPanelList')),
      body: SingleChildScrollView(
        //ExpansionList 一定要放在可以滚动的widget里
        child: ExpansionPanelList(
          expansionCallback: (index,bol){
             _currentState(index,bol);
          },
          //根据list的个数，插入 ExpansionPanel,并继续生成List
          children: mlist.map((index){
            return ExpansionPanel(
              //Fun ->(){},widget->()
              headerBuilder: (context,bol){
                return ListTile(title: Text('This is No.$index'));
              },
              body: ListTile(title: Text('$index detail')),
              isExpanded: expansionlist[index].isOpen
            );
          }).toList()
        ),
      )
    );
  }
}

//每个小项的开关管理，申明类
class ExpansionBean{
  var index;
  bool isOpen;
  ExpansionBean(this.index,this.isOpen);
}

import 'package:flutter/material.dart';

class ExpansionPanelListdemo extends StatefulWidget {
  @override
  _ExpansionPanelListdemoState createState() => _ExpansionPanelListdemoState();
}

class _ExpansionPanelListdemoState extends State<ExpansionPanelListdemo> {
  List<int> mlist;
  List<ExpansionBean> expansionlist;

  //这里直接调用这个类？？叫什么 与initstate区别？
  _ExpansionPanelListdemoState(){
    mlist = new List();
    expansionlist = new List();
    for(int i= 0;i<10;i++){
      mlist.add(i);
      //类型与类申明一致
      expansionlist.add(ExpansionBean(i, false));
    }
  }

  _currentState(index,bol){
    setState(() {
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
              //什么时候是(){},什么时候是{}/()
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

//??为什么要申明这个类，每个小项的开关管理
class ExpansionBean{
  var index;
  bool isOpen;
  ExpansionBean(this.index,this.isOpen);
}

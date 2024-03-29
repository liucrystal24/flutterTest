import 'package:demo1/searchdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,delegate: Searchdelegate());
            },
          )
        ],
      ),
    );
  }
}

class Searchdelegate extends SearchDelegate{
  // 四个组件 buildAcitons,buildLeading,buildResults,buildSuggestions 固定组件
  // 1.右侧 x ，搜索栏清空
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: ()=> query = ''
      )
    ];
  }
  //2. 左侧 <- 关闭searchbar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: transitionAnimation,
      ),
      onPressed: ()=>close(context,null)
    );
  }
  //3. 点击搜索后完毕展示结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        )
      ),
    );
  }
  //4. 下方建议列表
  @override
  Widget buildSuggestions(BuildContext context) {
    // suggestList 是推荐菜单，本应从后台模拟，但是此处为写死数据
    // searchList 是通过搜索query 关键字，模拟的数据，为死数据
    final suggestionList = query.isEmpty
    ?suggestList
    :searchList.where((input)=>input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index){
        return ListTile(
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style:TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style:TextStyle(
                    color: Colors.grey
                  ),
                )
              ]
            ),
          ),
        );
      },
    );
  }
}
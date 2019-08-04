import 'package:flutter/material.dart';

class ExpansionTiledemo extends StatefulWidget {
  @override
  _ExpansionTiledemoState createState() => _ExpansionTiledemoState();
}

class _ExpansionTiledemoState extends State < ExpansionTiledemo > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionTitle')),
      body: Center(
        child: ExpansionTile(
          backgroundColor: Colors.white10,
          title: Text('ChrisLiu'),
          leading: Icon(Icons.ac_unit),
          children: < Widget > [
            ListTile(
              title: Text('age: 25'),
              subtitle: Text('Company: SCC'),
            )
          ],
          initiallyExpanded: false,
        ),
      ),
    );
  }
}
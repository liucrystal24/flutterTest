import 'package:flutter/material.dart';

class PathClipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('PathClip'),),
      //裁切控件
      body: ClipPath(
        clipper: Buttomclip(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          color: Colors.deepPurpleAccent,
        ),
      )
    );
  }
}

class Buttomclip extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var path = new Path();
    var firstPoint = Offset(size.width/4, size.height);
    var secondPoint = Offset(size.width/2, size.height-50);
    var thirdPoint = Offset(size.width*3/4, size.height-100);
    var endPoint = Offset(size.width, size.height-50);

    path.lineTo(0, 0);
    path.lineTo(0, endPoint.dy);
    //贝塞尔曲线 接下来的两个点的坐标值
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);
    // path.lineTo(secondPoint.dx, secondPoint.dy);
    path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return null;
  }

}
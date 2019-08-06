import 'package:flutter/material.dart';
import 'main.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000)
    );
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context)=> new TestHome()
          ),
          (route)=> route == null
        );
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://pic1.zhimg.com/80/v2-820f41e6555c0515d8e488fe20587ed9_hd.jpg',
        fit: BoxFit.cover,
        scale: 2.0,
        ),
    );
  }
}
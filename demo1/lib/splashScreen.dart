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
    //控制器 _controller 起到定时器的作用，animation 动画变化效果
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000)
    );
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    //addStatus -> 绑定在动画，不是控制器
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(
            builder: (context)=> new TestHome()
          ),
          (route) => route == null
        );
      }
    });
    //控制器开始计时工作
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    //控制器结束
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://pic4.zhimg.com/80/v2-016f974f5620d550d5a226a0213585de_hd.jpg',
        fit:BoxFit.fill,
        scale: 2.0,
      ),
    );
  }
}
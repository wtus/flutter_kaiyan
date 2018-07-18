import 'dart:async';

import 'package:flutter/material.dart';

class TypeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int milliseconds;
  final int delay;

  const TypeText(
      {this.text,
      this.style: const TextStyle(color: Colors.black),
      this.milliseconds: 1000,
      this.delay: 0});

  @override
  State<TypeText> createState() {
    return _TypeTextState();
  }
}

class _TypeTextState extends State<TypeText>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<int> animation;
  String showText = '';
  String hideText = '';
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.milliseconds));

    animation = IntTween(begin: 0, end: widget.text.length).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animation.addListener(() {
      print('${animation.value}');
      setState(() {
        showText = widget.text.substring(0, animation.value);
        hideText = widget.text.substring(animation.value, widget.text.length);
      });
    });

    Future.delayed(Duration(milliseconds: widget.delay), () {
      animationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Text(showText);
    return RichText(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: <TextSpan>[
        TextSpan(text: showText, style: widget.style),
        TextSpan(
            text: hideText,
            style: widget.style.copyWith(color: Colors.transparent))
      ]),
    );
  }
}

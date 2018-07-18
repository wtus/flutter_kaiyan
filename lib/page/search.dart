import 'package:flutter/material.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  String test_txt = '我是士大夫!';
  Tween<int> tween;
  AnimationController animationController;
  Animation<int> animation;
  String text;

  @override
  void initState() {
    super.initState();
    animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation = IntTween(begin: 0, end: test_txt.length).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));

    animation.addListener(() {
      print('${animation.value}');
      setState(() {
        text = test_txt.substring(0, animation.value);
      });
    });

    animationController.forward(from: 0.0);
  }

  final List<String> items = [
    '开眼世界杯',
    '世界杯',
    '阅后即瞎',
    '日食',
    '谷阿莫',
    '励志',
    '健身',
    '美食',
    '一条'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: '这个功能暂时不可以用',
                              suffixIcon: Icon(Icons.search),
                              icon: Icon(
                                Icons.search,
                                color: Colors.red,
                              ),
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(Icons.save)))),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text('取消'))
              ],
            ),
            TitleItem(
              text: '热搜关键词',
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (c, i) {
                      return Container(
                          height: 35.0,
                          child: Text(items[i],
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)));
                    }),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

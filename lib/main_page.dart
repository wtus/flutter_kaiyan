import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kaiyan/page/login.dart';
import 'package:kaiyan/page/main/page0.dart';
import 'package:kaiyan/page/main/page1.dart';
import 'package:kaiyan/page/main/page2.dart';
import 'package:kaiyan/page/main/page3.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/comon_wiget.dart';
import 'package:kaiyan/widget/route_animation.dart';
import 'package:scoped_model/scoped_model.dart';

int _curIndex = 0;
_MainPageState main;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() {
    main = _MainPageState();
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<IndexModel>(
      model: IndexModel(),
      child: Scaffold(
        body: SafeArea(child: _body()),
        bottomNavigationBar: Container(
          height: 38.3,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              MyDivider(),
              Container(
                height: 38.0,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconText(0),
                    IconText(1),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            AnimationPageRoute(
                                slideTween: Tween<Offset>(
                                    begin: Offset(1.0, 0.0), end: Offset.zero),
                                builder: (c) {
                                  return Login();
                                }));
                      },
                      child: Image.asset(
                        Constant.dir_image + 'publish_add.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    )),
                    IconText(2),
                    IconText(3),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return ScopedModelDescendant<IndexModel>(
      builder: (ctx, child, model) {
        return IndexedStack(
          index: model._index,
          children: <Widget>[Page0(), Page1(), Page2(), Page3()],
        );
      },
    );
  }

  final MaterialColor c_normal = Colors.blue;
  final MaterialColor c_select = Colors.red;

  Widget getIcon(int i, IconData data) {
    if (i == _curIndex) {
      return Icon(
        data,
        color: c_select,
      );
    }
    return Icon(
      data,
      color: c_normal,
    );
  }
}

class IconText extends StatefulWidget {
  final int index;

  const IconText(this.index);

  @override
  State<IconText> createState() {
    return _IconTextState();
  }
}

class _IconTextState extends State<IconText> {
  var titles = ['首页', '关注', '通知', '我的'];
  var icons = [
    'ic_tab_strip_icon_feed.png',
    'ic_tab_strip_icon_follow.png',
    'ic_tab_strip_icon_category.png',
    'ic_tab_strip_icon_profile.png'
  ];
  var icons_selcect = [
    'ic_tab_strip_icon_feed_selected.png',
    'ic_tab_strip_icon_follow_selected.png',
    'ic_tab_strip_icon_category_selected.png',
    'ic_tab_strip_icon_profile_selected.png'
  ];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<IndexModel>(
      builder: (ctx, child, model) {
        return Expanded(
          child: GestureDetector(
            child: Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  // Icon(Icons.ac_unit),
                  Image.asset(
                    widget.index == model._index
                        ? Constant.dir_image + icons_selcect[widget.index]
                        : Constant.dir_image + icons[widget.index],
                    height: 27.0,
                  ),
                  Text(
                    titles[widget.index],
                    style: TextStyle(fontSize: 8.0),
                  )
                ],
              ),
            ),
            onTap: () {
              model.changeIndex(widget.index);
            },
          ),
        );
      },
    );
  }
}

class IndexModel extends Model {
  int _index = 0;

  void changeIndex(int i) {
    _index = i;
    notifyListeners();
  }
}

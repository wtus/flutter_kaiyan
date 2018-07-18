import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';

class Interaction extends StatefulWidget {
  @override
  State<Interaction> createState() {
    return _InteractionState();
  }
}

class _InteractionState extends State<Interaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          Constant.dir_image + 'pgc_default_avatar.png',
          width: 60.0,
        ),
        Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Text("别错过重要的信息",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0))),
        Text(
          '登录后即可查看评论回复、点赞及关注等通知',
          style: TextStyle(color: Colors.grey, fontSize: 15.0),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0),
          width: 200.0,
          height: 40.0,
          color: Colors.blue,
          child: Center(
            child: Text(
              '登录',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

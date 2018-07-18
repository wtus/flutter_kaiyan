import 'package:flutter/material.dart';
import 'package:kaiyan/util/constant.dart';
import 'package:kaiyan/widget/type_text.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          Constant.dir_image + 'author_account_bg.png',
          fit: BoxFit.cover,
        ),
      ),
      Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '开眼Demo',
              style: TextStyle(color: Colors.white, fontSize: 27.0),
            ),
            TypeText(
              delay: 100,
              text: '开眼Demo开眼Demo开眼Demo开眼Demo开眼Demo',
              style: TextStyle(color: Colors.white),
            ),
            FractionalTranslation(
              translation: const Offset(1.0, 0.0),
              child: TypeText(
                delay: 1000,
                text: 'Code by Wuht',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

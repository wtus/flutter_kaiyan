import 'package:flutter/material.dart';
import 'package:kaiyan/widget/comon_wiget.dart';

class FormNotification extends StatefulWidget {
  @override
  State<FormNotification> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<FormNotification> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                AvatarItem(
                  text1: '官方通知',
                  text2: '一周前',
                ),
                Text(
                    'balalbalbalblalblbalblalbalblalblalblalblalblalblalblalbllalblalbalblabbalbalalbalbalblalblbalblalbalblalblalblalblalblalblalblalbllalblalbalblabbal')
              ],
            ),
          ),
    );
  }
}

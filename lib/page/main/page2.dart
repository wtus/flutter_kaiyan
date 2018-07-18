import 'package:flutter/material.dart';
import 'package:kaiyan/page/main/page2/interaction.dart';
import 'package:kaiyan/page/main/page2/notification1.dart';
import 'package:kaiyan/widget/kaiyan_indictor.dart';

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() {
    return _Page2State();
  }
}

class _Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[FormNotification(), Interaction()],
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          new SliverAppBar(
            title: Text(
              'Notification',
              style: TextStyle(color: Colors.black, fontFamily: 'Lobster'),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 34.0),
              child: Container(
                height: 34.0,
                child: new TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicator: KaiyanIndictor(),
                  tabs: <Tab>[
                    new Tab(
                      text: "官方",
                    ),
                    new Tab(
                      text: "互动",
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}

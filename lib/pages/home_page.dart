import 'package:flutter/material.dart';
import 'package:nft_app/components/my_tabbar.dart';
import 'package:nft_app/tabs/editors_Pick.dart';
import 'package:nft_app/tabs/top_tab.dart';
import 'package:nft_app/tabs/trending_tab.dart';
import '../tabs/recent_tab.dart';
import '../components/my_appbar.dart';
import '../components/my_bottombar.dart';
import '../theme/const.dart';
import '../util/glass_box.dart';

// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // user tapped searched button - empty for now
  void searchButtonTapped() {}

  // tab options
  List tabOption = [ //List of tab options appearing on the second row of the screen
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()],
    ["Editor's pick", editors_Pick()],
  ];

  // bottom bar navigation
  int _currentBottonIndex = 0;
  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottonIndex = index!; //Used to know which tab we have clicked on at the bottom
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottonIndex,
            onTap: _handleIndexChanged,
          ),
        ),
        body: ListView(
          children: [
            // title + search button
            MyAppBar(
              title: 'Explore Collections',
              onSearchTap: searchButtonTapped,
            ),

            // tab bar
            SizedBox(
              height: 600,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
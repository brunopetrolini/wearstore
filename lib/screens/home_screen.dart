import 'package:flutter/material.dart';
import 'package:lojavirtual/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pageController = PageController();

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        HomeTab(),
      ],
    );
  }
}

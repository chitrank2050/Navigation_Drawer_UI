import 'package:flutter/material.dart';

import 'package:side_drawer_ui/layout/dashboard.dart';
import 'package:side_drawer_ui/layout/menu.dart';
import 'package:side_drawer_ui/pages/my_cards_page.dart';

class MenuDashboardLayout extends StatefulWidget {
  @override
  _MenuDashboardLayoutState createState() => _MenuDashboardLayoutState();
}

class _MenuDashboardLayoutState extends State<MenuDashboardLayout>
    with SingleTickerProviderStateMixin {
  final Color backgroundColor = Color(0xFF4A4A58);
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onMenuTap() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();

      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          Menu(
            slideAnimation: _slideAnimation,
            menuScaleAnimation: _menuScaleAnimation,
          ),
          Dashboard(
            duration: duration,
            isCollapsed: isCollapsed,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            controller: _controller,
            scaleAnimation: _scaleAnimation,
            backgroundColor: backgroundColor,
            child: MyCardsPage(onMenuTap: onMenuTap),
          ),
        ],
      ),
    );
  }
}
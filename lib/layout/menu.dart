import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_drawer_ui/bloc/navigation_bloc.dart';

class Menu extends StatelessWidget {
  final Animation<double> menuScaleAnimation;
  final Animation<Offset> slideAnimation;
  final int selectedIndex;

  const Menu({
    Key key,
    this.menuScaleAnimation,
    this.slideAnimation,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvents.DashboardClickedEvent);
                  },
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 0
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvents.MessagesClickedEvent);
                  },
                  child: Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 1
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvents.UtilityClickedEvent);
                  },
                  child: Text(
                    "Utility Bills",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: selectedIndex == 2
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text("Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
                SizedBox(height: 30),
                Text("Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

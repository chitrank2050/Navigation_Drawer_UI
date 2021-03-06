import 'package:flutter/material.dart';
import 'package:side_drawer_ui/bloc/navigation_bloc.dart';

class MessagesPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const MessagesPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.menu, color: Colors.white),
                onTap: onMenuTap,
              ),
              Text(
                'My Messages',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Icon(Icons.settings, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile/screens/landing/AppDraw.dart';

class HomeTabletPortait extends StatelessWidget {
  const HomeTabletPortait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer(),
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(
              children: children,
            )
          : Row(children: children.reversed.toList()),
    );
  }
}

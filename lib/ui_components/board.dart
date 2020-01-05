import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui_components/field.dart';

import 'grid.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[Grid(), Field()],
      ),
    );
  }
}
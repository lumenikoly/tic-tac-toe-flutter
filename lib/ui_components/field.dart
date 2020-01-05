import 'package:flutter/material.dart';
import 'cell.dart';

class Field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Cell(0),
                Cell(1),
                Cell(2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Cell(3),
                Cell(4),
                Cell(5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Cell(6),
                Cell(7),
                Cell(8),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui_components/app_bar.dart';
import 'package:tic_tac_toe/ui_components/board.dart';
import 'package:tic_tac_toe/ui_components/statistics_panel.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(),
      body: Column(
        children: <Widget>[
          Expanded(child: Board()),
          Align(
            child: StatisticsPanel(),
            alignment: FractionalOffset.bottomCenter,
          ),
        ],
      ),
    );
  }
}

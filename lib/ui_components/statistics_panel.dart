import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic_model.dart';

class StatisticsPanel extends StatelessWidget {
  final TextStyle winXStyle = TextStyle(color: Colors.red, fontSize: 18);
  final TextStyle winOStyle = TextStyle(color: Colors.blue, fontSize: 18);
  final TextStyle gameStyle = TextStyle(color: Colors.white, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedDefaultTextStyle(
            child: Text(
              "X : ${Provider.of<LogicModel>(context).totalScoreX}",
            ),
            style: Provider.of<LogicModel>(context).winner == 1
                ? winXStyle
                : gameStyle,
            duration: Duration(milliseconds: 500),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
          ),
          AnimatedDefaultTextStyle(
            child: Text(
              "O : ${Provider.of<LogicModel>(context).totalScoreO}",
            ),
            duration: Duration(milliseconds: 500),
            style: Provider.of<LogicModel>(context).winner == 2
                ? winOStyle
                : gameStyle,
          ),
        ],
      ),
    );
  }
}

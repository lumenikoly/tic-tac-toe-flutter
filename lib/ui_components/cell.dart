import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logic_model.dart';
import 'circle/circle.dart';
import 'cross/cross.dart';

class Cell extends StatefulWidget {
  final int cellNumber;
  Cell(this.cellNumber);

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  int cellState = 0;
  int _cellNumber;

  void initState() {
    _cellNumber = widget.cellNumber;
    super.initState();
  }

  Widget _checkCell(BuildContext context) {
    cellState = Provider.of<LogicModel>(context).board[_cellNumber];
    if (cellState == 0) {
      return Container(
        color: Colors.transparent,
      );
    } else if (cellState == 1) {
      return Padding(padding: EdgeInsets.all(25), child: Cross());
    } else
      return Padding(padding: EdgeInsets.all(15), child: Circle());
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            child: _checkCell(context),
          ),
          onTap: () {
            Provider.of<LogicModel>(context, listen: false)
                .cellTaped(widget.cellNumber);
          },
        ));
  }
}

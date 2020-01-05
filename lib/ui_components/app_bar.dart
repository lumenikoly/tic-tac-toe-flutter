import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic_model.dart';

class AppBarMenu extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Заново!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                Provider.of<LogicModel>(context).resetGame();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

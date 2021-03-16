import 'package:connect_four/ui/drawer_widget.dart';
import 'package:flutter/material.dart';

class Othello extends StatefulWidget {
  @override
  _OthelloState createState() => _OthelloState();
}

class _OthelloState extends State<Othello> {
  int _player = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Othello'),
        shape: BeveledRectangleBorder(),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    child: Center(
                        child: Text("Player 1",
                            style: TextStyle(
                                fontSize: 24,
                                color: _player == 1
                                    ? Colors.black
                                    : Colors.grey))),
                    decoration: BoxDecoration(
                      color: _player == 1 ? Colors.red : Colors.red[200],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: Center(
                      child: Text(
                        "Player 2",
                        style: TextStyle(
                            fontSize: 24,
                            color: _player == 2 ? Colors.black : Colors.grey),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _player == 2 ? Colors.yellow : Colors.yellow[200],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildBoard(),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget buildBoard() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 18,
          offset: Offset(15.0, 7.0),
          spreadRadius: 7.0,
        ),
      ]),
      child: Stack(
        children: [
          getGreenTiles(),
          getChips(),
        ],
      ),
    );
  }

  Widget getChips() {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 40,
            width: 40,
            color: Colors.transparent,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _player == 1 ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getGreenTiles() {
    List<Widget> col = List.generate(
      8,
      (i) => Row(
        children: List.generate(
          8,
          (j) => GestureDetector(
            onTap: () {
              tapped(i, j);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.green[700],
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return Column(
      children: col,
    );
  }

  tapped(int i, int j) {
    print('$i , $j');
    _player = _player == 1 ? 2 : 1;
    setState(() {});
  }
}

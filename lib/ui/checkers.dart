import 'package:flutter/material.dart';

class Checkers extends StatefulWidget {
  @override
  _CheckersState createState() => _CheckersState();
}

class _CheckersState extends State<Checkers> {
  int _player = 1;
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    'Select a game to play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
                title: Text('Connect Them'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }),
            ListTile(
                title: Text('Tic Tack Three'),
                onTap: () {
                  Navigator.pushNamed(context, '/tic');
                }),
            ListTile(
                title: Text('Checkout checkers'),
                onTap: () {
                  Navigator.pushNamed(context, '/checkers');
                }),
          ],
        ),
      ),
      appBar: AppBar(
        shape: BeveledRectangleBorder(),
        title: Text("Chick Check"),
        bottomOpacity: 0.1,
      ),
      body: Center(
        child: Column(
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
              child: Stack(
                children: [
                  Align(alignment: Alignment.center, child: buildBoard()),
                ],
              ),
            ),
            InkWell(
                child: Center(
                    child: Text('Clear', style: TextStyle(fontSize: 30))),
                onTap: () {
                  // _model.clear();
                  _player = 1;
                  _opacity = 0.0;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }

  Widget buildBoard() {
    Color off = Color(0xFFCCCCCC);
    List<Widget> colList = List<Widget>();
    for (int i = 0; i < 8; i++) {
      List<Widget> list = List<Widget>();
      Color first = Colors.black;
      Color second = off;
      if (i % 2 != 0) {
        first = off;
        second = Colors.black;
      }
      for (int j = 0; j < 8; j++) {
        list.add(
          GestureDetector(
            onTap: () {
              print('Row $i, Column $j');
            },
            child: Container(
              height: 40,
              width: 40,
              color: j % 2 != 0 ? first : second,
            ),
          ),
        );
      }
      colList.add(Row(
        children: list,
      ));
    }
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0x99222222),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 10,
                  color: Color(0x99222222),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: colList,
              ),
            ),
          ],
        ));
  }
}

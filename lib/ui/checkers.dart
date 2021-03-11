import 'package:flutter/material.dart';
import 'package:connect_four/model/check_model.dart';

class Checkers extends StatefulWidget {
  @override
  _CheckersState createState() => _CheckersState();
}

enum SelectionState {
  waiting,
  selected,
}

class _CheckersState extends State<Checkers> {
  int _player = 1;
  double _opacity = 0.0;
  int _currentSelectionX = 0;
  int _currentSelectionY = 0;
  SelectionState currentState = SelectionState.waiting;

  CheckModel _model = CheckModel();

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
                  buildBoard(),
                  IgnorePointer(
                    ignoring: true,
                    child: putChipsOnBoard(),
                  ),
                ],
              ),
            ),
            InkWell(
                child: Center(
                    child: Text('Clear', style: TextStyle(fontSize: 30))),
                onTap: () {
                  _model.clear();
                  _player = 1;
                  _opacity = 0.0;
                  _currentSelectionX = 0;
                  _currentSelectionY = 0;
                  currentState = SelectionState.waiting;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }

  Widget buildBoard() {
    Color offWhite = Color(0xFFCCCCCC);
    List<Widget> rowList = List<Widget>();
    for (int i = 0; i < 8; i++) {
      List<Widget> list = List<Widget>();
      Color firstColorOfRow = Colors.black;
      Color secondColorOfRow = offWhite;
      if (i % 2 != 0) {
        firstColorOfRow = offWhite;
        secondColorOfRow = Colors.black;
      }
      for (int j = 0; j < 8; j++) {
        list.add(
          GestureDetector(
            onTapDown: (details) {
              switch (currentState) {
                case SelectionState.waiting:
                  {
                    //If the selection is not the current player continue waiting
                    if (_model.gridList[i][j] != _player) {
                      break;
                    }
                    _currentSelectionX = i;
                    _currentSelectionY = j;
                    currentState = SelectionState.selected;
                    setState(() {});
                    break;
                  }
                case SelectionState.selected:
                  {
                    //Check if there is a piece on that square already
                    //Make sure that the square is a valid square to land on.
                    if (_model.gridList[i][j] != 0 ||
                        (i % 2 == 0 && j % 2 == 0) ||
                        (i % 2 != 0 && j % 2 != 0)) {
                      break;
                    }

                    //If move is the same piece originally selected return to waiting
                    if (i == _currentSelectionX && j == _currentSelectionY) {
                      currentState = SelectionState.waiting;
                      break;
                    }
                    if (!_model.isMoveValid(_currentSelectionX,
                        _currentSelectionY, i, j, _player)) {
                      break;
                    }
                    _model.move(
                        _currentSelectionX, _currentSelectionY, i, j, _player);
                    currentState = SelectionState.waiting;
                    setState(() {
                      _player = _player == 1 ? 2 : 1;
                    });
                    break;
                  }
                default:
                  {
                    _currentSelectionX = 0;
                    _currentSelectionY = 0;
                    currentState = SelectionState.selected;
                    setState(() {});
                    break;
                  }
              }
            },
            child: Container(
              height: 40,
              width: 40,
              color: j % 2 != 0 ? firstColorOfRow : secondColorOfRow,
            ),
          ),
        );
      }
      rowList.add(Row(
        children: list,
      ));
    }
    return Container(
      padding: EdgeInsets.all(12),
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
              children: rowList,
            ),
          ),
        ],
      ),
    );
  }

  Widget putChipsOnBoard() {
    List<Widget> rowList = List<Widget>();
    _model.gridList.forEach((row) {
      List<Widget> list = List<Widget>();
      row.forEach((value) {
        list.add(buildChip(value));
      });
      rowList.add(Row(
        children: list,
      ));
    });

    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 10,
                color: Colors.transparent,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowList,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChip(int player) {
    if (player == 0) {
      return Container(
          padding: EdgeInsets.all(5),
          height: 40,
          width: 40,
          color: Colors.transparent);
    }
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: player == 1 ? Colors.white : Colors.black45,
          width: 2,
        ),
        shape: BoxShape.circle,
        color: player == 1 ? Color(0xFF443333) : Colors.red,
      ),
    );
  }
}

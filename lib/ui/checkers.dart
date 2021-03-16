import 'package:connect_four/ui/drawer_widget.dart';
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
      drawer: DrawerWidget(),
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
            AnimatedOpacity(
              duration: Duration(milliseconds: 700),
              opacity: _opacity,
              child: Container(
                child: Text(
                  'Player $_player wins',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
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
          //The gestureDetector starts here.
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
                    //if the same chip is selected 0 out the currentSelection
                    // variables and return to waiting
                    if (i == _currentSelectionX && j == _currentSelectionY) {
                      _currentSelectionX = 0;
                      _currentSelectionY = 0;
                      currentState = SelectionState.waiting;
                      setState(() {});
                      break;
                    }

                    //Check if there is a piece on that square already
                    //Make sure that the square is a valid square to land on.
                    if (_model.gridList[i][j] != 0 ||
                        (i % 2 == 0 && j % 2 == 0) ||
                        (i % 2 != 0 && j % 2 != 0)) {
                      break;
                    }

                    // Check if the move is not valid
                    if (!_model.isMoveValid(_currentSelectionX,
                        _currentSelectionY, i, j, _player)) {
                      break;
                    }

                    //Make the move and return to waiting.
                    _model.move(
                        _currentSelectionX, _currentSelectionY, i, j, _player);
                    currentState = SelectionState.waiting;
                    List<int> count = _model.countRemaining();
                    if (count[0] == 0 || count[1] == 0) {
                      _opacity = 1.0;
                      setState(() {});
                      break;
                    }
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

    for (int i = 0; i < _model.gridList.length; i++) {
      List<Widget> list = List<Widget>();
      for (int j = 0; j < _model.gridList[i].length; j++) {
        if (i == _currentSelectionX && j == _currentSelectionY) {
          list.add(buildChip(_model.gridList[i][j], true));
          continue;
        }
        list.add(buildChip(_model.gridList[i][j], false));
      }
      rowList.add(Row(
        children: list,
      ));
    }

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

  Widget buildChip(int player, bool selected) {
    if (player == 0) {
      return Container(
          padding: EdgeInsets.all(5),
          height: 40,
          width: 40,
          color: Colors.transparent);
    }
    return selected
        ? Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: Offset(3.0, 3.0))
              ],
              border: Border.all(
                color: player == 1 ? Colors.blue : Colors.white,
                width: 2,
              ),
              shape: BoxShape.circle,
              color: player == 1 ? Color(0xFF443333) : Colors.red,
            ),
          )
        : Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    spreadRadius: 1.0,
                    blurRadius: 10.0,
                    offset: Offset(3.0, 3.0))
              ],
              border: Border.all(
                color: player == 1 ? Colors.white : Colors.red,
                width: 2,
              ),
              shape: BoxShape.circle,
              color: player == 1 ? Color(0xFF443333) : Colors.red,
            ),
          );
  }
}

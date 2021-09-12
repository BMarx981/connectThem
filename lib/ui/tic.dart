import 'package:flutter/material.dart';
import 'package:connect_four/model/ticModel.dart';

import 'drawer_widget.dart';

class Tic extends StatefulWidget {
  Tic({Key key}) : super(key: key);

  @override
  _TicState createState() => _TicState();
}

class _TicState extends State<Tic> {
  int _player = 1;
  double _opacity = 0.0;

  TicModel _model = TicModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          shape: BeveledRectangleBorder(),
          title: Text("Tic Tac"),
        ),
        body: Column(
          children: [
            //Player row
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      child: Container(
                        child: Center(
                            child: Text("Player 1",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: _player == 1
                                        ? Colors.black
                                        : Colors.grey))),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: _player == 2
                            ? null
                            : [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, 4.0),
                                    color: Color.lerp(
                                        Colors.grey.shade600, Colors.white, .3))
                              ],
                        border: _player == 2
                            ? null
                            : Border.all(color: Colors.yellow, width: 2),
                        borderRadius: BorderRadius.circular(12),
                        color: _player == 1 ? Colors.red : Colors.red[200],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
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
                        boxShadow: _player == 1
                            ? null
                            : [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    offset: Offset(4.0, 4.0),
                                    color: Color.lerp(
                                        Colors.grey.shade600, Colors.white, .3))
                              ],
                        border: _player == 1
                            ? null
                            : Border.all(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(12),
                        color:
                            _player == 2 ? Colors.yellow : Colors.yellow[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //TicTacToe board
            Expanded(
              child: Container(
                padding: EdgeInsets.all(18),
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cellSelected(0, 0);
                      },
                      child: Container(
                        child: buildContainer(
                            _model.grid[0][0] > 0 ? _model.grid[0][0] : 0),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Colors.transparent,
                            ),
                            right: BorderSide(
                              color: Colors.black,
                            ),
                            top: BorderSide(
                              color: Colors.transparent,
                            ),
                            bottom: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(0, 1);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[0][1] > 0 ? _model.grid[0][1] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(0, 2);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[0][2] > 0 ? _model.grid[0][2] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.transparent,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(1, 0);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[1][0] > 0 ? _model.grid[1][0] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(1, 1);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[1][1] > 0 ? _model.grid[1][1] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(1, 2);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[1][2] > 0 ? _model.grid[1][2] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.transparent,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(2, 0);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[2][0] > 0 ? _model.grid[2][0] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(2, 1);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[2][1] > 0 ? _model.grid[2][1] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.black,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cellSelected(2, 2);
                      },
                      child: Container(
                        child: Container(
                          child: buildContainer(
                              _model.grid[2][2] > 0 ? _model.grid[2][2] : 0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.transparent,
                              ),
                              right: BorderSide(
                                color: Colors.transparent,
                              ),
                              top: BorderSide(
                                color: Colors.transparent,
                              ),
                              bottom: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Container(
                child: Text(
                  'Player $_player wins',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _opacity = 0;
                _model.grid.forEach((row) {
                  for (int i = 0; i < row.length; i++) {
                    row[i] = 0;
                  }
                });
                _player = 1;
                setState(() {});
              },
              child: Text(
                'Clear',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void cellSelected(int row, int col) {
    _model.grid[row][col] = _player;
    if (_model.isWinner(_player)) {
      _opacity = 1;
      setState(() {});
    } else {
      setState(() {});
      changePlayer(_player);
    }
  }

  void changePlayer(int selection) {
    if (selection == 1) {
      _player = 2;
    } else {
      _player = 1;
    }
  }

  Widget buildContainer(int op) {
    if (op == 0) {
      return Container(child: Text(' '));
    }
    return AnimatedOpacity(
      duration: Duration(
        milliseconds: 500,
      ),
      opacity: 1,
      child: Center(
        child: Container(
          child: op == 1
              ? Text(
                  "X",
                  style: TextStyle(fontSize: 32),
                )
              : Text(
                  "O",
                  style: TextStyle(fontSize: 32),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:connect_four/model/ticModel.dart';

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
        title: Text("Tic Tac"),
      ),
      body: Column(
        children: [
          //Player row
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
                              color:
                                  _player == 1 ? Colors.black : Colors.grey))),
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
    );
  }

  void cellSelected(int row, int col) {
    _model.grid[row][col] = _player;
    print(_model.isWinner(_player));
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

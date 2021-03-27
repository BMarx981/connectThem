import 'package:connect_four/model/othello_model.dart';
import 'package:connect_four/ui/drawer_widget.dart';
import 'package:flutter/material.dart';

class Othello extends StatefulWidget {
  @override
  _OthelloState createState() => _OthelloState();
}

class _OthelloState extends State<Othello> {
  int _player = 1;
  OthelloModel _model = OthelloModel();

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
                                        ? Colors.white
                                        : Colors.black87.withOpacity(.3)))),
                      ),
                      decoration: BoxDecoration(
                        boxShadow: _player == 2
                            ? null
                            : [
                                BoxShadow(
                                    blurRadius: 2.0,
                                    offset: Offset(3.0, 3.0),
                                    color: Color.lerp(
                                        Colors.black, Colors.white, .7))
                              ],
                        border: _player == 2
                            ? null
                            : Border.all(color: Colors.black, width: 2),
                        borderRadius:
                            _player == 2 ? null : BorderRadius.circular(12),
                        color: _player == 1 ? Colors.black : Colors.black38,
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
                                    offset: Offset(3.0, 3.0),
                                    color: Color.lerp(
                                        Colors.white, Colors.black, .8))
                              ],
                        border: _player == 1
                            ? Border.all(color: Colors.black38, width: 2)
                            : Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(12),
                        color: _player == 2 ? Colors.white : Colors.white24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildBoard(),
                ],
              ),
            ),
            InkWell(
              child: Text(
                'Clear',
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                _model.clear();
                setState(() {
                  _player = 1;
                });
              },
            )
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
      child: getGreenTiles(),
    );
  }

  Widget getChips(int i, int j) {
    double opac = _model.grid[i][j] == 0 ? 0 : 1;
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 40,
            width: 40,
            color: Colors.transparent,
          ),
          Container(
            height: 30,
            width: 30,
            child: Container(
              child: PhysicalModel(
                color: _model.grid[i][j] == 1
                    ? Colors.black.withOpacity(opac)
                    : Colors.grey[200].withOpacity(opac),
                shape: BoxShape.circle,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green[900].withOpacity(opac),
                        blurRadius: 3,
                        offset: Offset(5.0, 2.0),
                        spreadRadius: 2.0,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: _model.grid[i][j] == 1
                        ? Colors.black.withOpacity(opac)
                        : Colors.grey[200].withOpacity(opac),
                  ),
                ),
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
              if (_model.grid[i][j] != 0) {
                return;
              }
              tapped(i, j);
            },
            child: Container(
              child: getChips(i, j),
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
    _model.tileSelected(i, j, _player);
    _player = _player == 1 ? 2 : 1;
    setState(() {});
  }
}

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
      body: Column(
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
          )
        ],
      ),
    );
  }
}

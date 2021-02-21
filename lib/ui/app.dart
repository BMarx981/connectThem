import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _player = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Connect them"),
        ),
        body: ListView(
          //Main Column
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    child: Center(child: Text("Player 1")),
                    decoration: BoxDecoration(
                      color: _player == 1 ? Colors.red : Colors.red[200],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: Center(child: Text("Player 2")),
                    decoration: BoxDecoration(
                      color: _player == 2 ? Colors.yellow : Colors.yellow[200],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              //Main Row for game board
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gameBoardColumn(number: 1),
                gameBoardColumn(number: 2),
                gameBoardColumn(number: 3),
                gameBoardColumn(number: 4),
                gameBoardColumn(number: 5),
                gameBoardColumn(number: 6),
                gameBoardColumn(number: 7),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget gameBoardColumn({int number}) {
    return Column(
      children: [
        columnButton(colNum: number),
        columnButton(colNum: number),
        columnButton(colNum: number),
        columnButton(colNum: number),
        columnButton(colNum: number),
        columnButton(colNum: number),
        columnButton(colNum: number),
      ],
    );
  }

  Widget columnButton({int colNum}) {
    return GestureDetector(
      onTap: () {
        print("$colNum Tapped");
        if (_player == 1) {
          _player = 2;
        } else {
          _player = 1;
        }
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue[900]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.0),
          )),
        ),
      ),
    );
  }
}

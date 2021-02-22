import 'package:flutter/material.dart';
import 'package:connect_four/model/model.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _player = 1;

  Model model = Model();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Connect them"),
        ),
        body: ListView(
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
            SizedBox(height: 50),
            Row(
              //Main Row for game board
              mainAxisAlignment: MainAxisAlignment.center,
              children: getGameBoardColumns(),
            ),
            SizedBox(height: 170),
            InkWell(
                child: Center(
                    child: Text('Clear', style: TextStyle(fontSize: 40))),
                onTap: () {
                  model.clear();
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }

  List<Widget> getGameBoardColumns() {
    int i = 1;
    List<Widget> returningColumn = List<Widget>();
    model.colLists.forEach((column) {
      returningColumn.add(gameBoardColumn(i++, column));
    });
    return returningColumn;
  }

  Widget gameBoardColumn(int number, List<ChipColor> chipColors) {
    return Column(
      children: getBoardColumnButtons(number, chipColors),
    );
  }

  List<Widget> getBoardColumnButtons(int number, List<ChipColor> colors) {
    List<Widget> returningList = List<Widget>();
    colors.forEach((color) {
      returningList.add(columnButton(number, color));
    });
    return returningList;
  }

  Widget columnButton(int colNum, ChipColor color) {
    return GestureDetector(
      onTap: () {
        // print("$colNum Tapped by player $_player");
        if (_player == 1) {
          _player = 2;
        } else {
          _player = 1;
        }
        setState(() {
          model.colLists[colNum - 1][model.findNextSlot(colNum - 1) - 1] =
              _player == 2 ? ChipColor.red : ChipColor.yellow;
        });
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue[900]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Container(
              child: Text(' '),
            ),
            backgroundColor: getChipColor(color),
          ),
        ),
      ),
    );
  }

  Color getChipColor(ChipColor color) {
    switch (color) {
      case ChipColor.white:
        return Colors.white;
        break;
      case ChipColor.red:
        return Colors.red;
        break;
      case ChipColor.yellow:
        return Colors.yellow;
        break;
      default:
        return Colors.white;
    }
  }
}

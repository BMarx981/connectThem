import 'package:flutter/material.dart';
import 'package:connect_four/model/model.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  int _player = 1;
  double _opacity = 0.0;

  Model model = Model();
  AnimationController aniController;

  @override
  void initState() {
    super.initState();
    aniController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 100,
    );
    aniController.addListener(() {
      setState(() {});
    });
  }

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
            AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacity,
                child: Center(
                  child: Container(
                    height: 100,
                    child: Text(
                      'Player $_player wins',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )),
            SizedBox(height: 70),
            InkWell(
                child: Center(
                    child: Text('Clear', style: TextStyle(fontSize: 40))),
                onTap: () {
                  model.clear();
                  _player = 1;
                  _opacity = 0.0;
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
        int index = model.findNextSlot(colNum - 1) - 1;
        if (index >= 0) {
          if (_player == 1) {
            _player = 2;
          } else {
            _player = 1;
          }
          setState(() {
            model.colLists[colNum - 1][index] =
                _player == 1 ? ChipColor.yellow : ChipColor.red;
          });
          // aniController.forward();
          if (model.isAWinner(colNum, index)) {
            if (_player == 1) {
              _player = 2;
            } else {
              _player = 1;
            }
            setState(() {});
            _opacity = 1.0;
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blue[900]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(top: aniController.value),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: getChipColor(color),
              ),
              child: Container(
                child: Text(' '),
              ),
              width: 30.0,
              height: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  void dropAChip(int colNum, int index) {
    List<ChipColor> list = model.colLists[colNum];
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

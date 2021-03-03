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

  Model _model = Model();

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
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getBackChips(),
              ),
              Row(
                //Main Row for game board
                mainAxisAlignment: MainAxisAlignment.center,
                children: getGameBoardColumns(),
              ),
            ]),
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
            SizedBox(height: 40),
            InkWell(
                child: Center(
                    child: Text('Clear', style: TextStyle(fontSize: 30))),
                onTap: () {
                  _model.clear();
                  _player = 1;
                  _opacity = 0.0;
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }

  List<Widget> getBackChips() {
    List<Column> chipCol = List<Column>();
    for (int i = 0; i < _model.colLists.length; i++) {
      List<Widget> colors = List<Widget>();
      for (int j = 0; j < _model.colLists[i].length; j++) {
        colors.add(getChipPiece(_model.colLists[i][j]));
      }
      print(_model.colLists[i]);
      chipCol.add(Column(
        children: colors,
      ));
    }
    return chipCol;
  }

  Widget getChipPiece(ChipColor color) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: getChipColor(color),
        ),
        child: Text(" "));
  }

  List<Widget> getGameBoardColumns() {
    int i = 1;
    List<Widget> returningColumn = List<Widget>();
    _model.colLists.forEach((column) {
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
        int index = _model.findNextSlot(colNum - 1) - 1;
        print("Tapped button");
        if (index >= 0) {
          if (_player == 1) {
            _player = 2;
          } else {
            _player = 1;
          }
          setState(() {
            _model.colLists[colNum - 1][index] =
                _player == 1 ? ChipColor.yellow : ChipColor.red;
          });
          // aniController.forward();
          if (_model.isAWinner(colNum, index)) {
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
        height: 50,
        width: 50,
        child: getBlueRect(),
      ),
    );
  }

  CustomPaint getBlueRect() {
    return CustomPaint(painter: HolePainter());
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

class HolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue;

    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()
            ..addRect(Rect.fromCenter(
              // Offset(0.5, 0.5), Offset(0.5, 0.5),
              center: Offset(size.width / 2, size.height / 2),
              width: 50,
              height: 50,
            )),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width / 2, size.height / 2), radius: 15))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

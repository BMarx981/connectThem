import 'dart:core';

enum ChipColor {
  red,
  yellow,
  white,
}

class Model {
  List<List<ChipColor>> colLists = [
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
    [
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
      ChipColor.white,
    ],
  ];

  int findNextSlot(int col) {
    int index = 0;
    colLists[col].forEach((element) {
      if (element == ChipColor.white) {
        index++;
      }
    });
    return index;
  }

  void clear() {
    this.colLists.forEach((col) {
      for (int i = 0; i < col.length; i++) {
        col[i] = ChipColor.white;
      }
    });
  }

  bool isAWinner(int colNum, int index) {
    ChipColor color = colLists[colNum][index];
    int count = 0;
    bool val;

    if (colLists[colNum][index + 1] == ChipColor.white ||
        colLists[colNum][index + 1] == null) {
      val = false;
    } else if (colLists[colNum][index + 1] == ChipColor.white ||
        colLists[colNum][index - 1] == null) {
      val = false;
    }

    return val;
  }
}

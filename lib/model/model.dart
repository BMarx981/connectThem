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
    ChipColor mainColor = colLists[colNum - 1][index];
    int width = colLists.length - 1;
    int height = colLists[0].length;
    bool val = false;

    //Vertical Check the grid
    for (int j = 0; j < height - 3; j++) {
      for (int i = 0; i <= width; i++) {
        if (colLists[i][j] == mainColor &&
            colLists[i][j + 1] == mainColor &&
            colLists[i][j + 2] == mainColor &&
            colLists[i][j + 3] == mainColor) {
          val = true;
        }
      }
    }

    //Horizontal check
    for (int i = 0; i <= width - 3; i++) {
      for (int j = 0; j < height; j++) {
        if (colLists[i][j] == mainColor &&
            colLists[i + 1][j] == mainColor &&
            colLists[i + 2][j] == mainColor &&
            colLists[i + 3][j] == mainColor) {
          val = true;
        }
      }
    }

    //ascending diagonal check
    for (int i = 3; i <= width; i++) {
      for (int j = 0; j < height - 3; j++) {
        if (colLists[i][j] == mainColor &&
            colLists[i - 1][j + 1] == mainColor &&
            colLists[i - 2][j + 2] == mainColor &&
            colLists[i - 3][j + 3] == mainColor) {
          val = true;
        }
      }
    }
    //descending diagonal check
    for (int i = 3; i <= width; i++) {
      for (int j = 3; j < height; j++) {
        if (colLists[i][j] == mainColor &&
            colLists[i - 1][j - 1] == mainColor &&
            colLists[i - 2][j - 2] == mainColor &&
            colLists[i - 3][j - 3] == mainColor) {
          val = true;
        }
      }
    }

    return val;
  }
}

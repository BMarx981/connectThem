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
    print('$mainColor colNum: $colNum index: $index $width, $height');
    bool val = false;

    //Vertical Check the grid
    for (int j = 0; j < width - 3; j++) {
      for (int i = 0; i < height; i++) {
        print(
            'Horizontal i = $i : j = $j ${colLists[i][j]} ${colLists[i][j + 1]}  ${colLists[i][j + 2]} ${colLists[i][j + 3]}');
        if (colLists[i][j] == mainColor &&
            colLists[i][j + 1] == mainColor &&
            colLists[i][j + 2] == mainColor &&
            colLists[i][j + 3] == mainColor) {
          val = true;
        }
      }
    }

    //Horizontal check
    for (int i = 0; i < width - 3; i++) {
      for (int j = 0; j < height; j++) {
        print(
            'Vertical i = $i : j = $j ${colLists[i][j]} ${colLists[i + 1][j]} ${colLists[i + 2][j]} ${colLists[i + 3][j]}');
        if (colLists[i][j] == mainColor &&
            colLists[i + 1][j] == mainColor &&
            colLists[i + 2][j] == mainColor &&
            colLists[i + 3][j] == mainColor) {
          val = true;
        }
      }
    }

    //ascending diagonal check
    for (int i = 3; i < colLists.length - 1; i++) {
      for (int j = 0; j < colLists[0].length - 3; j++) {
        if (colLists[i][j] == mainColor &&
            colLists[i - 1][j + 1] == mainColor &&
            colLists[i - 2][j + 2] == mainColor &&
            colLists[i - 3][j + 3] == mainColor) {
          val = true;
        }
      }
    }
    //descending diagonal check
    for (int i = 3; i < colLists.length - 1; i++) {
      for (int j = 3; j < colLists[0].length - 1; j++) {
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

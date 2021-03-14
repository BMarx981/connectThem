class CheckModel {
  List<List<int>> gridList = [
    [0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0],
    [0, 1, 0, 1, 0, 1, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [2, 0, 2, 0, 2, 0, 2, 0],
    [0, 2, 0, 2, 0, 2, 0, 2],
    [2, 0, 2, 0, 2, 0, 2, 0],
  ];
  setInitialChips() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 8; j++) {
        if (i % 2 == 0 && j % 2 != 0) {
          gridList[i][j] = 1;
        }
        if (i % 2 != 0 && j % 2 == 0) {
          gridList[i][j] = 1;
        }
      }
    }
    for (int i = 3; i >= 3 && i < 5; i++) {
      for (int j = 0; j < 8; j++) {
        gridList[i][j] = 0;
      }
    }
    for (int i = 5; i >= 5 && i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (i % 2 != 0 && j % 2 == 0) {
          gridList[i][j] = 2;
        }
        if (i % 2 == 0 && j % 2 != 0) {
          gridList[i][j] = 2;
        }
      }
    }
  }

  bool isMoveValid(int oldX, int oldY, int newX, int newY, int player) {
    bool value = false;
    if (player == 1) {
      if ((oldX + 1 == newX && oldY - 1 == newY) ||
          (oldX + 1 == newX && oldY + 1 == newY)) {
        value = true;
      }
      if ((oldY - newY == 2 || newY - oldY == 2) &&
          oldX + 2 == newX &&
          oldY - 2 == newY &&
          gridList[oldX + 1][oldY - 1] == 2) {
        gridList[oldX + 1][oldY - 1] = 0;
        value = true;
      }
      if (oldY + 2 <= 7 &&
          (oldY - newY == 2 || newY - oldY == 2) &&
          oldX + 2 == newX &&
          oldY + 2 == newY &&
          gridList[oldX + 1][oldY + 1] == 2) {
        gridList[oldX + 1][oldY + 1] = 0;
        value = true;
      }
      if ((oldY - newY == 0 || newY - oldY == 0) &&
          oldX + 4 == newX &&
          (gridList[oldX + 1][oldY - 1] == 2 ||
              gridList[oldX + 1][oldY + 1] == 2) &&
          (gridList[oldX + 2][oldY - 2] == 0 ||
              gridList[oldX + 2][oldY + 2] == 0)) {
        if (gridList[oldX + 1][oldY - 1] == 2) {
          gridList[oldX + 1][oldY - 1] = 0;
        } else if (gridList[oldX + 1][oldY + 1] == 2) {
          gridList[oldX + 1][oldY + 1] = 0;
        }
        value = true;
        gridList[oldX + 3][oldY - 1] = 0;
      }
      if ((oldY - newY == 4 || newY - oldY == 4) &&
          oldX + 4 == newX &&
          (gridList[oldX + 1][oldY - 1] == 2 ||
              gridList[oldX + 1][oldY + 1] == 2) &&
          (gridList[oldX + 2][oldY - 2] == 0 ||
              gridList[oldX + 2][oldY + 2] == 0)) {
        if (gridList[oldX + 1][oldY - 1] == 2 &&
            gridList[oldX + 3][oldY - 3] == 2) {
          gridList[oldX + 1][oldY - 1] = 0;
          gridList[oldX + 3][oldY - 3] = 0;
        }
        if (gridList[oldX + 1][oldY + 1] == 2 &&
            gridList[oldX + 3][oldY + 3] == 2) {
          gridList[oldX + 1][oldY + 1] = 0;
          gridList[oldX + 3][oldY + 3] = 0;
        }
        value = true;
      }
    }

    if (player == 2) {
      if ((oldX - 1 == newX && oldY - 1 == newY) ||
          (oldX - 1 == newX && oldY + 1 == newY)) {
        value = true;
      }

      if ((oldY - newY == 2 || newY - oldY == 2) &&
          oldX - 2 == newX &&
          oldY - 2 == newY &&
          gridList[oldX - 1][oldY - 1] == 1) {
        gridList[oldX - 1][oldY - 1] = 0;
        value = true;
      }
      if (oldY + 2 <= 7 &&
          (oldY - newY == 2 || newY - oldY == 2) &&
          oldX - 2 == newX &&
          oldY + 2 == newY &&
          gridList[oldX - 1][oldY + 1] == 1) {
        gridList[oldX - 1][oldY + 1] = 0;
        value = true;
      }
      if ((oldY - newY == 0 || newY - oldY == 0) &&
          oldX - 4 == newX &&
          (gridList[oldX - 1][oldY - 1] == 1 ||
              gridList[oldX - 1][oldY + 1] == 1) &&
          (gridList[oldX - 2][oldY - 2] == 0 ||
              gridList[oldX - 2][oldY + 2] == 0)) {
        if (gridList[oldX - 1][oldY - 1] == 1) {
          gridList[oldX - 1][oldY - 1] = 0;
        }
        if (gridList[oldX - 1][oldY + 1] == 1) {
          gridList[oldX - 1][oldY + 1] = 0;
        }
        value = true;
        gridList[oldX - 3][oldY - 1] = 0;
      }
      if ((oldY - newY == 4 || newY - oldY == 4) &&
          oldX - 4 == newX &&
          (gridList[oldX - 1][oldY - 1] == 1 ||
              gridList[oldX - 1][oldY + 1] == 1) &&
          (gridList[oldX - 2][oldY - 2] == 0 ||
              gridList[oldX - 2][oldY + 2] == 0)) {
        if (gridList[oldX - 1][oldY - 1] == 1 &&
            gridList[oldX - 3][oldY - 3] == 1) {
          gridList[oldX - 1][oldY - 1] = 0;
          gridList[oldX - 3][oldY - 3] = 0;
        }
        if (gridList[oldX - 1][oldY + 1] == 1 &&
            gridList[oldX - 3][oldY + 3] == 1) {
          gridList[oldX - 1][oldY + 1] = 0;
          gridList[oldX - 3][oldY + 3] = 0;
        }
        value = true;
      }
    }
    return value;
  }

  List<int> countRemaining() {
    List<int> counts = [0, 0];
    gridList.forEach((list) {
      list.forEach((element) {
        if (element == 1) {
          counts[0]++;
        }
        if (element == 2) {
          counts[1]++;
        }
      });
    });
    return counts;
  }

  move(int oldRow, int oldCol, int newRow, int newCol, int player) {
    gridList[oldRow][oldCol] = 0;
    gridList[newRow][newCol] = player;
  }

  void clear() {
    List<int> list = [0, 0, 0, 0, 0, 0, 0, 0];
    gridList.forEach((element) {
      element.replaceRange(0, 8, list);
    });
    setInitialChips();
  }
}

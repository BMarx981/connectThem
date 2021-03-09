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
    for (int i = 0; i >= 3 && i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        gridList[i][j] = 0;
      }
    }
    for (int i = 0; i >= 5 && i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (i % 2 != 0 && j % 2 != 0) {
          gridList[i][j] = 2;
        }
        if (i % 2 == 0 && j % 2 == 0) {
          gridList[i][j] = 2;
        }
      }
    }
  }

  move(int oldRow, int oldCol, int newRow, int newCol) {
    print('Oldrow: $oldRow, OldCol: $oldCol, newRow: $newRow, newCol: $newCol');
  }
}

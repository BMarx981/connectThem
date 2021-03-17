class OthelloModel {
  List<List<int>> grid = [
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 2, 0, 0, 0],
    [0, 0, 0, 2, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
  ];

  tileSelected(int i, int j, player) {
    int opponent = player == 1 ? 2 : 1;
    if (grid[i][j] != 0) {
      return;
    }
    grid[i][j] = player;
    print(grid);

    _searchSouth(player, opponent, i, j);
    _searchSouthEast(player, opponent, i, j);
    _searchEast(player, opponent, i, j);
    _searchNorthEast(player, opponent, i, j);
    _searchNorth(player, opponent, i, j);
    _searchNorthWest(player, opponent, i, j);
    _searchWest(player, opponent, i, j);
    _searchSouthWest(player, opponent, i, j);
  }

  _searchSouth(int player, int opponent, int i, int j) {
    for (int index = i; index < 8; index++) {
      if (grid[index][j] == 0) {
        index = 8;
      } else if (grid[index][j] == player) {
        index = 8;
      } else if (grid[index][j] == opponent) {
        grid[index][j] = player;
      }
    }
  }

  _searchSouthEast(int player, int opponent, int i, int j) {
    int indexRow = i;
    int indexCol = j;
    while (indexRow < 8 && indexCol < 8) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 8;
        indexCol = 8;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 8;
        indexCol = 8;
      } else if (grid[indexRow][indexCol] == opponent) {
        grid[indexRow][indexCol] = player;
      }
      print('SE Row $indexRow, Col: $indexCol');
      indexRow++;
      indexCol++;
    }
  }

  _searchEast(int player, int opponent, int i, int j) {
    for (int index = j; index < 8; index++) {
      if (grid[i][index] == 0) {
        index = 8;
      } else if (grid[i][index] == player) {
        index = 8;
      } else if (grid[i][index] == opponent) {
        grid[i][index] = player;
      }
    }
  }

  _searchNorthEast(int player, int opponent, int i, int j) {
    int indexRow = i;
    int indexCol = j;
    while (indexRow >= 0 && indexCol < 8) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == opponent) {
        grid[indexRow][indexCol] = player;
      }
      print('NE Row $indexRow, Col: $indexCol');
      indexRow--;
      indexCol++;
    }
  }

  _searchNorth(int player, int opponent, int i, int j) {
    for (int index = i; i >= 0; i--) {
      if (grid[index][j] == 0) {
        index = 0;
      } else if (grid[index][j] == player) {
        index = 0;
      } else if (grid[index][j] == opponent) {
        grid[index][j] = player;
      }
    }
  }

  _searchNorthWest(int player, int opponent, int i, int j) {
    int indexRow = i;
    int indexCol = j;
    while (indexRow >= 0 && indexCol >= 0) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == opponent) {
        grid[indexRow][indexCol] = player;
      }
      print('NW Row $indexRow, Col: $indexCol');
      indexRow--;
      indexCol--;
    }
  }

  _searchWest(int player, int opponent, int i, int j) {
    for (int index = j; index >= 0; index--) {
      if (grid[i][index] == 0) {
        index = 0;
      } else if (grid[i][index] == player) {
        index = 0;
      } else if (grid[i][index] == opponent) {
        grid[i][index] = player;
      }
    }
  }

  _searchSouthWest(int player, int opponent, int i, int j) {
    int indexRow = i;
    int indexCol = j;
    while (indexRow < 8 && indexCol >= 0) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 8;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 8;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == opponent) {
        grid[indexRow][indexCol] = player;
      }
      print('SW Row $indexRow, Col: $indexCol op: $opponent');
      indexRow++;
      indexCol--;
    }
  }
}

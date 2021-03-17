import 'dart:math';

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

  clear() {
    grid = [
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 2, 0, 0, 0],
      [0, 0, 0, 2, 1, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0],
    ];
  }

  tileSelected(int i, int j, player) {
    int opponent = player == 1 ? 2 : 1;
    if (grid[i][j] != 0) {
      return;
    }
    grid[i][j] = player;

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
    List<Point> list = [];
    bool check = false;
    for (int index = i + 1; index < 8; index++) {
      if (grid[index][j] == 0) {
        index = 8;
      } else if (grid[index][j] == player) {
        index = 8;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[index][j] == opponent) {
        list.add(Point(index, j));
      }
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchSouthEast(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    int indexRow = i + 1;
    int indexCol = j + 1;
    while (indexRow < 8 && indexCol < 8) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 8;
        indexCol = 8;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 8;
        indexCol = 8;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[indexRow][indexCol] == opponent) {
        list.add(Point(indexRow, indexCol));
      }
      indexRow++;
      indexCol++;
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchEast(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    for (int index = j + 1; index < 8; index++) {
      if (grid[i][index] == 0) {
        index = 8;
      } else if (grid[i][index] == player) {
        index = 8;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[i][index] == opponent) {
        list.add(Point(i, index));
      }
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchNorthEast(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    int indexRow = i - 1;
    int indexCol = j + 1;
    while (indexRow >= 0 && indexCol < 8) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 0;
        indexCol = 0;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[indexRow][indexCol] == opponent) {
        list.add(Point(indexRow, indexCol));
      }
      indexRow--;
      indexCol++;
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchNorth(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    for (int index = i - 1; index >= 0; index--) {
      if (grid[index][j] == 0) {
        index = 0;
      } else if (grid[index][j] == player) {
        index = 0;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[index][j] == opponent) {
        print('Here');
        list.add(Point(index, j));
      }
    }
    print('T $check');
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchNorthWest(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    int indexRow = i - 1;
    int indexCol = j - 1;
    while (indexRow >= 0 && indexCol >= 0) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 0;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 0;
        indexCol = 0;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[indexRow][indexCol] == opponent) {
        list.add(Point(indexRow, indexCol));
      }
      indexRow--;
      indexCol--;
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchWest(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    for (int index = j - 1; index >= 0; index--) {
      if (grid[i][index] == 0) {
        index = 0;
      } else if (grid[i][index] == player) {
        index = 0;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[i][index] == opponent) {
        list.add(Point(i, index));
      }
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }

  _searchSouthWest(int player, int opponent, int i, int j) {
    List<Point> list = [];
    bool check = false;
    int indexRow = i + 1;
    int indexCol = j - 1;
    while (indexRow < 8 && indexCol >= 0) {
      if (grid[indexRow][indexCol] == 0) {
        indexRow = 8;
        indexCol = 0;
      } else if (grid[indexRow][indexCol] == player) {
        indexRow = 8;
        indexCol = 0;
        if (list.length > 0) {
          check = true;
        }
      } else if (grid[indexRow][indexCol] == opponent) {
        list.add(Point(indexRow, indexCol));
      }
      indexRow++;
      indexCol--;
    }
    if (check) {
      list.forEach((point) {
        grid[point.x][point.y] = player;
      });
    }
  }
}

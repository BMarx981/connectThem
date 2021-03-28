import 'dart:math';

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

  bool findAttackMove(int x, int y, int dx, int dy, int player, int opponent) {
    bool v = false;
    if (y < 0 || y > 7) {
      return false;
    }
    if (player == 1) {
      if (y < dy && gridList[dx - 1][dy - 1] == opponent) {
        gridList[dx - 1][dy - 1] = 0;
        v = true;
      } else if (y > dy && gridList[dx - 1][dy + 1] == opponent) {
        gridList[dx - 1][dy + 1] = 0;
        v = true;
      }
    }
    if (player == 2) {
      if (y < dy && gridList[dx + 1][dy - 1] == opponent) {
        gridList[dx + 1][dy - 1] = 0;
        v = true;
      } else if (y > dy && gridList[dx + 1][dy + 1] == opponent) {
        gridList[dx + 1][dy + 1] = 0;
        v = true;
      }
    }
    return v;
  }

  List<Point> recurseAttackMove(int x, int y, int dx, int dy, int player,
      int opponent, List<Point> list) {
    if (x > 7 || x < 0) {
      return list;
    }
    if (x == dx && y == dy) {
      return list;
    }

    if (player == 1) {
      if (findAttackMove(x + 2, y + 2, dx, dy, player, opponent)) {
        list.add(Point(x + 1, y + 1));
        return recurseAttackMove(x + 2, y + 2, dx, dy, player, opponent, list);
      } else if (findAttackMove(x + 2, y - 2, dx, dy, player, opponent)) {
        list.add(Point(x + 1, y - 1));
        return recurseAttackMove(x + 2, y - 2, dx, dy, player, opponent, list);
      }
    }

    if (player == 2) {
      if (findAttackMove(x - 2, y - 2, dx, dy, player, opponent)) {
        list.add(Point(x - 1, y - 1));
        return recurseAttackMove(x - 2, y - 2, dx, dy, player, opponent, list);
      } else if (findAttackMove(x - 2, y + 2, dx, dy, player, opponent)) {
        list.add(Point(x - 1, y + 1));
        return recurseAttackMove(x - 2, y + 2, dx, dy, player, opponent, list);
      }
    }
    return list;
  }

  bool isMoveValid(int oldX, int oldY, int newX, int newY, int player) {
    bool value = false;
    int opponent = player == 1 ? 2 : 1;
    int diff = (oldX - newX).abs();
    if (player == 1) {
      //If player one just moves to a valid open spot
      if (diff == 1) {
        return true;
      }
      //Player attacks a one jump.
      if (diff == 2) {
        return findAttackMove(oldX, oldY, newX, newY, player, opponent);
      } else if (diff > 2) {
        //Player attacks more than one opponent in a single move
        List<Point> list = [];
        List<Point> recList =
            recurseAttackMove(oldX, oldY, newX, newY, player, opponent, list);
        if (list.length == 0) {
          return false;
        }
        _zeroOutChips(recList);
        return true;
      }
    }

    if (player == 2) {
      // If player moves to vaild open spot
      if (diff == 1) {
        return true;
      }

      //Player attacks a one jump.
      if (diff == 2) {
        return findAttackMove(oldX, oldY, newX, newY, player, opponent);
      } else if (diff > 2) {
        //Player attacks more than one opponent in a single move
        List<Point> list = [];
        List<Point> recList =
            recurseAttackMove(oldX, oldY, newX, newY, player, opponent, list);
        if (list.length == 0) {
          return false;
        }
        _zeroOutChips(recList);
        return true;
      }
    }
    return value;
  }

  void _zeroOutChips(List<Point> list) {
    list.forEach((e) {
      gridList[e.x][e.y] = 0;
    });
  }

//Counts the remaining chips for each player
//Should be called after every move.
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

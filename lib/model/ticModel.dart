class TicModel {
  List<List<int>> grid = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0],
  ];

  bool isWinner(int n) {
    if (grid[0][0] == n && grid[0][1] == n && grid[0][2] == n) {
      return true;
    }
    if (grid[1][0] == n && grid[1][1] == n && grid[1][2] == n) {
      return true;
    }
    if (grid[2][0] == n && grid[2][1] == n && grid[2][2] == n) {
      return true;
    }
    if (grid[0][0] == n && grid[1][0] == n && grid[2][0] == n) {
      return true;
    }
    if (grid[0][1] == n && grid[1][1] == n && grid[2][1] == n) {
      return true;
    }
    if (grid[0][2] == n && grid[1][2] == n && grid[2][2] == n) {
      return true;
    }
    if (grid[0][0] == n && grid[1][1] == n && grid[2][2] == n) {
      return true;
    }
    if (grid[0][2] == n && grid[1][1] == n && grid[2][0] == n) {
      return true;
    }
    return false;
  }
}

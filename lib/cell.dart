import 'world.dart' as world;

// - - - - - -
// Class Cell
// - - - - - -

class Cell {
  bool alive = false;
  int x;
  int y;
  world.World? w;
  int xMax = 0;
  int yMax = 0;
  bool nextState = false;
  List<Cell> neighbors = List<Cell>.empty(growable: true);
  int neighborsAlive = 0;

  Cell({
    this.x = 0,
    this.y = 0,
    this.alive = false,
    this.w,
  }) {
    if (w != null) {
      xMax = w!.columns;
      yMax = w!.lines;
    }
  }

  bool isDead() {
    return alive == false;
  }

  bool isAlive() {
    return alive == true;
  }

  void setDead() {
    alive = false;
  }

  void setAlive() {
    alive = true;
  }

  @override
  String toString() {
    if (alive) {
      return "x";
    } else {
      return " ";
    }
  }

  void checkNeighbors() {
    neighbors.clear();
    neighborsAlive = 0;

    if (w != null) {
      for (int i in [-1, 0, 1]) {
        for (int j in [-1, 0, 1]) {
          if ((y + i >= 0 && y + i < yMax) &&
              (x + j >= 0 && x + j < xMax) &&
              (i != 0 || j != 0)) {
            neighbors.add(w!.cells[y + i][x + j]);
          }
        }
      }

      for (var nb in neighbors) {
        if (nb.isAlive()) {
          neighborsAlive++;
        }
      }
    }
  }

  void calculateNextState() {
    if (isAlive() && (neighborsAlive < 2 || neighborsAlive > 3)) {
      nextState = false;
    } else if (isDead() && neighborsAlive == 3) {
      nextState = true;
    } else {
      nextState = alive;
    }
  }

  void updateState() {
    alive = nextState;
  }
}

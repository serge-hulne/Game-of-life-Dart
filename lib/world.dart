import 'cell.dart' as cell;
import 'utils.dart' as utils;
import 'dart:io';

// - - - - - -
// Class World
// - - - - - -

class World {
  List<List<cell.Cell>> cells = List.empty(growable: true);
  final int lines;
  final int columns;

  //initializing
  World({this.lines = 0, this.columns = 0}) {
    for (int i = 0; i < lines; i++) {
      var cellsLine = List<cell.Cell>.empty(growable: true);
      for (int j = 0; j < columns; j++) {
        cellsLine.add(cell.Cell(
          x: j,
          y: i,
          alive: utils.randomBool(),
          w: this,
        ));
      }
      cells.add(cellsLine);
    }
  }

  // Displaying
  @override
  String toString() {
    final buf = StringBuffer('');
    for (int i = 0; i < lines; i++) {
      for (int j = 0; j < columns; j++) {
        buf.write((cells[i][j]).toString());
      }
      buf.write("\n");
    }
    return buf.toString();
  }

  // Running

  void run() {
    utils.clear();
    for (int generation = 0; generation < 10000; generation++) {
      print(this);

      // First check neighbors for all cells
      for (var cellLines in cells) {
        for (var cell in cellLines) {
          cell.checkNeighbors();
        }
      }

      // Then calculate the next state for all cells
      for (var cellLines in cells) {
        for (var cell in cellLines) {
          cell.calculateNextState();
        }
      }

      // Finally, update the state of all cells
      for (var cellLines in cells) {
        for (var cell in cellLines) {
          cell.updateState();
        }
      }

      // print("\nGeneration: $generation\n");
      sleep(const Duration(milliseconds: 1));
      utils.clear();
    }
    print("Done!\n");
  }
}

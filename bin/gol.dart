import 'package:gol/world.dart' as world;

main(List<String> arguments) {
  var w = world.World(
    lines: 25,
    columns: 80,
  );
  w.run();
}

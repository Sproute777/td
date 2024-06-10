import 'package:astar_dart/src/array2d.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test initializaition', () {
    final array = Array2d<bool>(3, 4, defaultValue: true);
    expect(array.length, 3); // Check number of cols
    expect(array[0].length, 4); // Check number of rows in first row
    expect(array[0][0], true); // Check default value for elements
  });

  test('test String defaultValue', () {
    final array = Array2d<String>(2, 2, defaultValue: "empty");
    expect(array[0][1], "empty"); // Check custom default value
  });

  test('test String defaultValue', () {
    final array = Array2d<String>(2, 2, defaultValue: "empty");
    expect(array[0][1], "empty"); // Check custom default value
  });

  test('test modification', () {
    final array = Array2d<bool>(3, 2, defaultValue: true);
    array[1][0] = false;
    expect(array[1][0], false);
  });
}

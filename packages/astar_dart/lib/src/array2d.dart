// /**
//  * canvas-astar.dart
//  * MIT licensed
//  *
//  * Created by Daniel Imms, http://www.growingwiththeweb.com
//  */

class Array2d<T> {
  late final List<List<T>> array;
  T defaultValue;

  Array2d(int width, int height, {required this.defaultValue}) {
    array = <List<T>>[];
    _width = width;
    _height = height;
  }

  List<T> operator [](int x) => array[x];

  get first => array.first;
  get length => array.length;

  set _width(int v) {
    while (array.length > v) {
      array.removeLast();
    }
    while (array.length < v) {
      final List<T> row = [];
      if (array.isNotEmpty) {
        for (int y = 0; y < array.first.length; y++) {
          row.add(defaultValue);
        }
      }
      array.add(row);
    }
  }

  set _height(int v) {
    while (array.first.length > v) {
      for (int x = 0; x < array.length; x++) {
        array[x].removeLast();
      }
    }
    while (array.first.length < v) {
      for (int x = 0; x < array.length; x++) {
        array[x].add(defaultValue);
      }
    }
  }
}

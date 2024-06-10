import 'dart:math';

import 'package:astar_dart/astar_dart.dart';
import 'package:flutter/material.dart';
import 'package:timing/timing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum TypeInput {
  start,
  barrier,
  targets,
  water,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  TypeInput _typeInput = TypeInput.start;

  // benchmark timing
  TimeTracker? timeTracker;
  int benchmark = 0;

  bool _showDoneList = true;
  bool _withDiagonals = true;
  Point<int> start = const Point<int>(0, 0);
  List<Tile> tiles = [];
  List<Point<int>> barriers = [];
  List<WeightedPoint> weighted = [
    const WeightedPoint(5, 5, weight: 5),
    const WeightedPoint(6, 5, weight: 5),
    const WeightedPoint(7, 5, weight: 5),
    const WeightedPoint(7, 6, weight: 5),
    const WeightedPoint(8, 5, weight: 5),
  ];
  List<Point<int>> targets = [];
  late int _rows;
  late int _columns;
  late AStarSquareGrid _astar;

  @override
  void initState() {
    super.initState();
    _rows = 20;
    _columns = 20;
    _astar = AStarSquareGrid(rows: _rows, columns: _columns);
    for (int x = 0; x < _rows; x++) {
      for (int y = 0; y < _columns; y++) {
        final point = Point(x, y);
        tiles.add(
          Tile(point),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A* double tap to find path'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                if (_showDoneList)
                  Text(
                    'done list ${tiles.where((i) => i.done).length},\npath length ${tiles.where((i) => i.selected).length} ${_getBenchmark()}',
                  )
              ],
            ),
          ),
          Row(
            children: [
              const Text('with diagonals'),
              Switch(
                value: _withDiagonals,
                onChanged: (value) {
                  setState(() {
                    _withDiagonals = value;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _typeInput = TypeInput.start;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _getColorSelected(TypeInput.start),
                  ),
                  child: const Text('START'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _typeInput = TypeInput.water;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _getColorSelected(TypeInput.water),
                  ),
                  child: const Text('WATER'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _typeInput = TypeInput.barrier;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _getColorSelected(TypeInput.barrier),
                  ),
                  child: const Text('BARRIES'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _typeInput = TypeInput.targets;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: _getColorSelected(TypeInput.targets),
                  ),
                  child: const Text('TARGETS'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      barriers.clear();
                      _cleanTiles();
                    });
                  },
                  child: const Text('CLEAN'),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: _columns,
              children: tiles.map((e) {
                return _buildItem(e);
              }).toList(),
            ),
          ),
          Row(
            children: [
              Switch(
                value: _showDoneList,
                onChanged: (value) {
                  setState(() {
                    _showDoneList = value;
                  });
                },
              ),
              const Text('Show done list')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItem(Tile e) {
    Color color = Colors.white;
    String text = '1';
    if (weighted.contains(e.position)) {
      color = Colors.cyan;
      text = weighted
          .firstWhere((i) => i.x == e.position.x && i.y == e.position.y)
          .weight
          .toString();
    }
    if (barriers.contains(e.position)) {
      color = Colors.red.withOpacity(.7);
      text = 'barrier';
    }
    if (e.done) {
      color = Colors.black.withOpacity(.2);
    }
    if (e.selected && _showDoneList) {
      color = Colors.green.withOpacity(.7);
    }

    if (targets.contains(e.position)) {
      color = Colors.purple.withOpacity(.7);
      text = '$text\ntarget';
    }

    if (e.position == start) {
      color = Colors.yellow.withOpacity(.7);
      text = '$text\nstart';
    }

    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 1.0),
        color: color,
      ),
      height: 10,
      child: InkWell(
        child: Text(
          text,
          style: const TextStyle(fontSize: 9, color: Colors.black),
        ),
        onDoubleTap: () => _start(e.position),
        onTap: () {
          if (_typeInput == TypeInput.start) {
            start = e.position;
          }

          if (_typeInput == TypeInput.barrier) {
            if (barriers.contains(e.position)) {
              barriers.remove(e.position);
            } else {
              barriers.add(e.position);
            }
          }
          if (_typeInput == TypeInput.targets) {
            if (targets.contains(e.position)) {
              targets.remove(e.position);
            } else {
              targets.add(e.position);
            }
          }
          if (_typeInput == TypeInput.water) {
            if (weighted.contains(e.position)) {
              weighted.remove(e.position);
            } else {
              weighted
                  .add(WeightedPoint(e.position.x, e.position.y, weight: 5));
            }
          }
          setState(() {});
        },
      ),
    );
  }

  String _getBenchmark() {
    if (timeTracker == null) return '';
    if (!timeTracker!.isFinished) return '';
    final duration = timeTracker!.duration;
    return 'benchmark: inMicroseconds: ${duration.inMicroseconds}';
  }

  MaterialStateProperty<Color> _getColorSelected(TypeInput input) {
    return MaterialStateProperty.all(
      _typeInput == input ? _getColorByType(input) : Colors.grey,
    );
  }

  Color _getColorByType(TypeInput input) {
    switch (input) {
      case TypeInput.start:
        return Colors.yellow;
      case TypeInput.barrier:
        return Colors.red;
      case TypeInput.targets:
        return Colors.purple;
      case TypeInput.water:
        return Colors.blue;
    }
  }

  void _start(Point<int> target) {
    _cleanTiles();
    List<Point<int>> done = [];
    late List<Point<int>> result;
    timeTracker = SyncTimeTracker()
      ..track(() {
        _astar.setPoints(weighted);
        _astar.setBarriers([...barriers, ...targets]
            .map((p) => BarrierPoint(p.x, p.y, barrier: Barrier.block))
            .toList());
        _astar.calculateGrid();
        result = _astar.findPath(
          doneList: (
            doneList,
          ) {
            done = doneList;
          },
          start: start,
          end: target,
        );
      });

    for (var element in result) {
      done.remove(element);
    }

    done.remove(start);

    setState(() {
      for (var element in tiles) {
        element.selected = result.any((r) {
          return r.x == element.position.x && r.y == element.position.y;
        });

        if (_showDoneList) {
          element.done = done.where((r) {
            return r == element.position;
          }).isNotEmpty;
        }
      }
    });
  }

  void _cleanTiles() {
    for (var element in tiles) {
      element.selected = false;
      element.done = false;
    }
  }
}

class Tile {
  final Point<int> position;
  bool selected = false;
  bool done = false;

  Tile(this.position);
}

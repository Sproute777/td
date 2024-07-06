import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../game_main.dart';

// mixin GameRef on Component {
//   FlameGame? _gameRef;

//    FlameGame get gameRef {
//     if (_gameRef == null) {
//       var c = parent;
//       while (c != null) {
//         if (c is HasGameRef) {
//           _gameRef = c.gameRef;
//           return _gameRef!;
//         } else if (c is T) {
//           _gameRef = c;
//           return c;
//         } else {
//           c = c.parent;
//         }
//       }
//       throw StateError('Cannot find reference FlameGame in the component tree');
//     }
//     return _gameRef!;
//   }

//   @override
//   void onRemove() {
//     super.onRemove();
//     _gameRef = null;
//   }

//   void registerToGame() {
//     gameRef.add(this);
//   }
// }

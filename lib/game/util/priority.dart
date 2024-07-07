abstract class Priority {
  /// updated before others
  static const int controller = 0;
  static const int background = 10;
  // ignore: constant_identifier_names
  static const int map = 20;
  static const int units = 25;
  static const int weapon = 28;
  static const int turret = 29;
  // ignore: constant_identifier_names
  static const int components = 30;
  static const int overlay = 35;

  // static int getComponentPriority(int bottom) {
  //   return _COMPONENTS + bottom;
  // }

  // static int getAbovePriority(int highestPriority) {
  //   return highestPriority + 5;
  // }

  // static int getLightingPriority(int highestPriority) {
  //   return highestPriority + 10;
  // }

  // static int getColorFilterPriority(int highestPriority) {
  //   return highestPriority + 20;
  // }

  // static int getInterfacePriority(int highestPriority) {
  //   return highestPriority + 30;
  // }

  // static int getJoystickPriority(int highestPriority) {
  //   return highestPriority + 40;
  // }
}

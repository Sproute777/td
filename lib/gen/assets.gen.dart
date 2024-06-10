/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blackhole.png
  AssetGenImage get blackhole =>
      const AssetGenImage('assets/images/blackhole.png');

  /// File path: assets/images/destroy.png
  AssetGenImage get destroy => const AssetGenImage('assets/images/destroy.png');

  /// File path: assets/images/destroy2.png
  AssetGenImage get destroy2 =>
      const AssetGenImage('assets/images/destroy2.png');

  /// File path: assets/images/diag_arrow.png
  AssetGenImage get diagArrow =>
      const AssetGenImage('assets/images/diag_arrow.png');

  /// File path: assets/images/diaglog.png
  AssetGenImage get diaglog => const AssetGenImage('assets/images/diaglog.png');

  /// Directory path: assets/images/enemy
  $AssetsImagesEnemyGen get enemy => const $AssetsImagesEnemyGen();

  /// Directory path: assets/images/neutual
  $AssetsImagesNeutualGen get neutual => const $AssetsImagesNeutualGen();

  /// Directory path: assets/images/weapon
  $AssetsImagesWeaponGen get weapon => const $AssetsImagesWeaponGen();

  /// File path: assets/images/whitehole.png
  AssetGenImage get whitehole =>
      const AssetGenImage('assets/images/whitehole.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [blackhole, destroy, destroy2, diagArrow, diaglog, whitehole];
}

class $AssetsImagesEnemyGen {
  const $AssetsImagesEnemyGen();

  /// File path: assets/images/enemy/enemyA.png
  AssetGenImage get enemyA =>
      const AssetGenImage('assets/images/enemy/enemyA.png');

  /// File path: assets/images/enemy/enemyB.png
  AssetGenImage get enemyB =>
      const AssetGenImage('assets/images/enemy/enemyB.png');

  /// File path: assets/images/enemy/enemyC.png
  AssetGenImage get enemyC =>
      const AssetGenImage('assets/images/enemy/enemyC.png');

  /// File path: assets/images/enemy/enemyD.png
  AssetGenImage get enemyD =>
      const AssetGenImage('assets/images/enemy/enemyD.png');

  /// List of all assets
  List<AssetGenImage> get values => [enemyA, enemyB, enemyC, enemyD];
}

class $AssetsImagesNeutualGen {
  const $AssetsImagesNeutualGen();

  /// File path: assets/images/neutual/mine.png
  AssetGenImage get mine =>
      const AssetGenImage('assets/images/neutual/mine.png');

  /// File path: assets/images/neutual/mine_cluster.png
  AssetGenImage get mineCluster =>
      const AssetGenImage('assets/images/neutual/mine_cluster.png');

  /// List of all assets
  List<AssetGenImage> get values => [mine, mineCluster];
}

class $AssetsImagesWeaponGen {
  const $AssetsImagesWeaponGen();

  /// File path: assets/images/weapon/Bullet1.png
  AssetGenImage get bullet1 =>
      const AssetGenImage('assets/images/weapon/Bullet1.png');

  /// File path: assets/images/weapon/Bullet2.png
  AssetGenImage get bullet2 =>
      const AssetGenImage('assets/images/weapon/Bullet2.png');

  /// File path: assets/images/weapon/Bullet_MG.png
  AssetGenImage get bulletMG =>
      const AssetGenImage('assets/images/weapon/Bullet_MG.png');

  /// File path: assets/images/weapon/Cannon.png
  AssetGenImage get cannon =>
      const AssetGenImage('assets/images/weapon/Cannon.png');

  /// File path: assets/images/weapon/Cannon2.png
  AssetGenImage get cannon2 =>
      const AssetGenImage('assets/images/weapon/Cannon2.png');

  /// File path: assets/images/weapon/Cannon3.png
  AssetGenImage get cannon3 =>
      const AssetGenImage('assets/images/weapon/Cannon3.png');

  /// File path: assets/images/weapon/MG.png
  AssetGenImage get mg => const AssetGenImage('assets/images/weapon/MG.png');

  /// File path: assets/images/weapon/MG2.png
  AssetGenImage get mg2 => const AssetGenImage('assets/images/weapon/MG2.png');

  /// File path: assets/images/weapon/MG3.png
  AssetGenImage get mg3 => const AssetGenImage('assets/images/weapon/MG3.png');

  /// File path: assets/images/weapon/Missile.png
  AssetGenImage get missile =>
      const AssetGenImage('assets/images/weapon/Missile.png');

  /// File path: assets/images/weapon/Missile_Launcher.png
  AssetGenImage get missileLauncher =>
      const AssetGenImage('assets/images/weapon/Missile_Launcher.png');

  /// File path: assets/images/weapon/Missile_Launcher2.png
  AssetGenImage get missileLauncher2 =>
      const AssetGenImage('assets/images/weapon/Missile_Launcher2.png');

  /// File path: assets/images/weapon/Missile_Launcher3.png
  AssetGenImage get missileLauncher3 =>
      const AssetGenImage('assets/images/weapon/Missile_Launcher3.png');

  /// File path: assets/images/weapon/Tower.png
  AssetGenImage get tower =>
      const AssetGenImage('assets/images/weapon/Tower.png');

  /// File path: assets/images/weapon/explosion1.png
  AssetGenImage get explosion1 =>
      const AssetGenImage('assets/images/weapon/explosion1.png');

  /// File path: assets/images/weapon/explosion2.png
  AssetGenImage get explosion2 =>
      const AssetGenImage('assets/images/weapon/explosion2.png');

  /// File path: assets/images/weapon/explosion3.png
  AssetGenImage get explosion3 =>
      const AssetGenImage('assets/images/weapon/explosion3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bullet1,
        bullet2,
        bulletMG,
        cannon,
        cannon2,
        cannon3,
        mg,
        mg2,
        mg3,
        missile,
        missileLauncher,
        missileLauncher2,
        missileLauncher3,
        tower,
        explosion1,
        explosion2,
        explosion3
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

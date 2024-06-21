// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StageBarState {
  int get killed => throw _privateConstructorUsedError;
  int get missed => throw _privateConstructorUsedError;
  int get wave => throw _privateConstructorUsedError;
  int get minerals => throw _privateConstructorUsedError;
}

/// @nodoc

class _$StageBarStateImpl extends _StageBarState with DiagnosticableTreeMixin {
  const _$StageBarStateImpl(
      {required this.killed,
      required this.missed,
      required this.wave,
      required this.minerals})
      : super._();

  @override
  final int killed;
  @override
  final int missed;
  @override
  final int wave;
  @override
  final int minerals;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StageBarState(killed: $killed, missed: $missed, wave: $wave, minerals: $minerals)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StageBarState'))
      ..add(DiagnosticsProperty('killed', killed))
      ..add(DiagnosticsProperty('missed', missed))
      ..add(DiagnosticsProperty('wave', wave))
      ..add(DiagnosticsProperty('minerals', minerals));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StageBarStateImpl &&
            (identical(other.killed, killed) || other.killed == killed) &&
            (identical(other.missed, missed) || other.missed == missed) &&
            (identical(other.wave, wave) || other.wave == wave) &&
            (identical(other.minerals, minerals) ||
                other.minerals == minerals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, killed, missed, wave, minerals);
}

abstract class _StageBarState extends StageBarState {
  const factory _StageBarState(
      {required final int killed,
      required final int missed,
      required final int wave,
      required final int minerals}) = _$StageBarStateImpl;
  const _StageBarState._() : super._();

  @override
  int get killed;
  @override
  int get missed;
  @override
  int get wave;
  @override
  int get minerals;
}

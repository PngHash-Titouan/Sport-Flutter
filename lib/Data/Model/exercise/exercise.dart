import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'exercise.freezed.dart';
part 'exercise.g.dart';

@freezed
class Exercise with _$Exercise {
  factory Exercise(
    String name,
    int imagesCount, {
    int? length,
    double? repetitionLength,
  }) = _Exercise;

  factory Exercise.fromJson(Map<String, dynamic> json) => _$ExerciseFromJson(json);
}

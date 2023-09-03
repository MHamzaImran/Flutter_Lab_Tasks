import 'package:flutter/material.dart';
import 'dart:async';

class ColorClass {
  late Stream colorStream;

  Stream<Color> getColors() async* {
    final List<Color> customColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange
    ];
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % customColors.length;
      return customColors[index];
    });
  }
}

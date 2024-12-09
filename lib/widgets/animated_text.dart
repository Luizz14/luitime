import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildAnimatedText(String timeText, Color color) {
  return AnimatedSwitcher(
    duration: const Duration(seconds: 1),
    transitionBuilder: (Widget child, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: animation.value,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: (1 - animation.value) * 20, // Blur decresce
                sigmaY: (1 - animation.value) * 20,
              ),
              child: child,
            ),
          );
        },
        child: child,
      );
    },
    child: Text(
      timeText,
      key: ValueKey<String>(timeText), // Chave única para o texto
      style: TextStyle(
        fontSize: 190,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
